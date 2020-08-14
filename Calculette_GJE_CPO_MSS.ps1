#================================
#Name : Calculette.ps1
#Author : Christopher Pardo / Gatien Jayme / Miguel Soares / Kevin Vaucher
#Date : 14.05.2020
#Update Date : 28.05.2020
#Version : 1.5
#Title : Calculatrice
#Description : This programm generate a calculator
#================================

#Graphic part ======================================================================================================================================================================
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window" Title="Initial Window" WindowStartupLocation = "CenterScreen"
    Width = "800" Height = "600" ShowInTaskbar = "True">
        <Canvas x:Name="Canvas">
            <TextBox Name="TextBox" Height="75" Width="315" Canvas.Top="80" Canvas.Left="50" IsReadOnly="True" FontSize="30" TextWrapping="Wrap"></TextBox>
            <TextBox Name="Historic" Height="480" Width="240"  Canvas.Left="530"  Canvas.Top="75" IsReadOnly="True" FontSize="30" TextWrapping="Wrap"></TextBox>
            
            <Button x:Name = "Button0" Height = "75" Width = "75" Content = '0' ToolTip = "0"
            Canvas.Left = '50' Canvas.Top = '480' Tag = '0'/>
            <Button x:Name = "Button1" Height = "75" Width = "75" Content = '1' ToolTip = "1"
            Canvas.Left = '50' Canvas.Top = '400' Tag = '1'/>
            <Button x:Name = "Button2" Height = "75" Width = "75" Content = '2' ToolTip = "2"
            Canvas.Left = '130' Canvas.Top = '400' Tag = '2'/>
            <Button x:Name = "Button3" Height = "75" Width = "75" Content = '3' ToolTip = "3"
            Canvas.Left = '210' Canvas.Top = '400' Tag = '3'/>
            <Button x:Name = "Button4" Height = "75" Width = "75" Content = '4' ToolTip = "4"
            Canvas.Left = '50' Canvas.Top = '320' Tag = '4'/>
            <Button x:Name = "Button5" Height = "75" Width = "75" Content = '5' ToolTip = "5"
            Canvas.Left = '130' Canvas.Top = '320' Tag = '5'/>
            <Button x:Name = "Button6" Height = "75" Width = "75" Content = '6' ToolTip = "6"
            Canvas.Left = '210' Canvas.Top = '320' Tag = '6'/>
            <Button x:Name = "Button7" Height = "75" Width = "75" Content = '7' ToolTip = "7"
            Canvas.Left = '50' Canvas.Top = '240' Tag = '7'/>
            <Button x:Name = "Button8" Height = "75" Width = "75" Content = '8' ToolTip = "8"
            Canvas.Left = '130' Canvas.Top = '240' Tag = '8'/>
            <Button x:Name = "Button9" Height = "75" Width = "75" Content = '9' ToolTip = "9"
            Canvas.Left = '210' Canvas.Top = '240' Tag = '9'/>
            
            <Button x:Name = "ButtonPlus" Height = "75" Width = "75" Content = '+' ToolTip = "+"
            Background="orange" Canvas.Left = '290' Canvas.Top = '480' Tag = ' + '/>
            <Button x:Name = "ButtonLess" Height = "75" Width = "75" Content = '-' ToolTip = "-"
            Background="orange" Canvas.Left = '290' Canvas.Top = '400' Tag = ' - '/>
            <Button x:Name = "ButtonTime" Height = "75" Width = "75" Content = '*' ToolTip = "*"
            Background="orange" Canvas.Left = '290' Canvas.Top = '240' Tag = ' * '/>
            <Button x:Name = "ButtonDiv" Height = "75" Width = "75" Content = '/' ToolTip = "/"
            Background="orange" Canvas.Left = '290' Canvas.Top = '320' Tag = ' / '/>
            <Button x:Name = "ButtonEgal" Height = "75" Width = "75" Content = '=' ToolTip = "="
            Background="yellow" Canvas.Left = '370' Canvas.Top = '480'/>
            <Button x:Name = "ButtonReset" Height = "75" Width = "75" Content = 'C' ToolTip = "C"
            Canvas.Left = '130' Canvas.Top = '480'/>
            <Button x:Name = "ButtonDot" Height = "75" Width = "75" Content = '.' ToolTip = "."
            Canvas.Left = '210' Canvas.Top = '480' Tag = '.'/>
            <Button x:Name = "ButtonBracket1" Height = "75" Width = "75" Content = '(' ToolTip = "("
            Background="orange" Canvas.Left = '50' Canvas.Top = '160' Tag = '( '/>
            <Button x:Name = "ButtonBracket2" Height = "75" Width = "75" Content = ')' ToolTip = ")"
            Background="orange" Canvas.Left = '130' Canvas.Top = '160' Tag = ' )'/>
        </Canvas>
</Window>
"@

 
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
$Window=[Windows.Markup.XamlReader]::Load( $reader )

#Connect to Control ===========================================================
for($i=0;$i -le 9; $i++){
    Set-Variable -name "button$($i)" -value $Window.FindName("Button$($i)")
}

$buttonEgal = $Window.FindName("ButtonEgal")
$buttonReset = $Window.FindName("ButtonReset")
$textBox = $Window.FindName("TextBox")
$historic = $Window.FindName("Historic")
$canvas = $Window.FindName("Canvas")
$form = $Window.FindName("Window")

[string]$global:cal = ''
$global:turn = 0


#Connect to actions ===========================================================
$canvas.Children | ForEach-Object {
    if($_.GetType().Name -eq "Button") {
        $_.Add_Click({param($sender, $e)
        if ($global:turn -eq 0) {
                $textBox.text += $sender.Tag
                $global:cal = $textBox.text
            } elseif ($global:turn -lt 0) {
                $textBox.text = $sender.Tag
                $global:cal = $textBox.text
                $global:turn = 0
            } else {
                $textBox.text += $sender.Tag
                $global:cal += $sender.Tag
            }
        })
    }
}

#Equal Button
$buttonEgal.Add_Click({
    try{
        $res = Invoke-Expression $global:cal
        #For the Error with a float
        if ($res -eq 'Infinity') {
             throw "Divide by 0"
        }
        $historic.text += $textBox.text + " = " + $res + "`n"
        $textBox.text = $res
        $global:cal = $res
        $global:turn ++
    } catch {
        $textBox.text = ''
        $textBox.text += $global:cal + " = Error"
        $global:turn = -1
    }
})

#Reset Button
$buttonReset.Add_Click({
    $textBox.text = ""
    $global:cal = ''
    $global:turn = 0
})

Add-Type -AssemblyName System.Windows.Forms
$form.Add_Closing({
    Remove-Variable * -ErrorAction SilentlyContinue
})
$form.ShowDialog() | Out-Null