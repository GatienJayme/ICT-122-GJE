# =====================================================================================================================
# NOM: Calculatrice.ps1
# AUTEUR: Gatien Jayme, CPNV
# DATE: 07/05/2020
#
# VERSION 1.0
# TITRE: Calculatrice
# DESCRIPTION: Programme servant à fournir une calculatrice complète à l'utilisateur
# =====================================================================================================================
# Vider l'écran pour l'affichage et affiche message de bienvenue
cls;


<# Import des classe.net#>
Add-Type –AssemblyName System.Windows.Forms

<# Création de notre fenêtre #>
$MainForm = New-Object System.Windows.Forms.Form

<# Position centré de la fenêtre et tailles de 500 largeur et hauteur #>
$MainForm.StartPosition = " CenterScreen "

$MainForm.Width = 500
$MainForm.Height = 500



# Calculer le résultat en fonction de l'opérateur
Switch -Exact($operateur)
{
    "+"
    {
        $Resultat = $premierNombre + $deuxiemeNombre;
        break;
    }
    "-"
    {
        $Resultat = $premierNombre - $deuxiemeNombre;
        break;
    }
    "*"
    {
        $Resultat = $premierNombre * $deuxiemeNombre;
        break;
    }
    "/"
    {
        $Resultat = $premierNombre / $deuxiemeNombre;
        break;
    }
    # Affiche l'erreur à l'utilisateur si mauvaise saisie
    default  
    {
        Write-Host "Erreur";
    }
}


# Ecrit le résultat
if($Resultat)
{
    Write-Host "Résultats : $premierNombre $operateur $deuxiemeNombre = $Resultat";
}


$zero = Windows.FindName("$btnzero")
$un = Windows.FindName("$btnun")
$deux = Windows.FindName("$btndeux")
$trois = Windows.FindName("$btntrois")
$quatre = Windows.FindName("$btnquatre")
$cinq = Windows.FindName("$btncinq")
$six = Windows.FindName("$btnsix")
$sept = Windows.FindName("$btnsept")
$huit = Windows.FindName("$btnhuit")
$neuf = Windows.FindName("$btnneuf")


$zero.Add_Click({
        $textbox.Text = $textbox.Text + '0'
        $MainForm.Text = "cool"
    })

$btnun.Add_Click({
        $textbox.Text = $textbox.Text + '1';
    })

$btndeux.Add_Click({
        $textbox.Text = $textbox.Text + '2';
    })

$btntrois.Add_Click({
        $textbox.Text = $textbox.Text + '3';
    })

$btnquatre.Add_Click({
        $textbox.Text = $textbox.Text + '4';
    })

$btncinq.Add_Click({
        $textbox.Text = $textbox.Text + '5';
    })

$btnsix.Add_Click({
        $textbox.Text = $textbox.Text + '6';
    })

$btnsept.Add_Click({
        $textbox.Text = $textbox.Text + '7';
    })

$btnhuit.Add_Click({
        $textbox.Text = $textbox.Text + '8';
    })

$btnneuf.Add_Click({
        $textbox.Text = $textbox.Text + '9';
    })



<# Création du bouton 0 #>
$zero = New-Object System.Windows.Forms.Button

$zero.Text = " 0 "

$zero.Location = ‘140, 160’

$zero.Click = $zero

$MainForm.Controls.Add($zero)



<# Création du bouton 1 #>
$un = New-Object System.Windows.Forms.Button

$un.Text = " 1 "

$un.Location = ‘60,70’

$MainForm.Controls.Add($un)


<# Création du bouton 2 #>
$deux = New-Object System.Windows.Forms.Button

$deux.Text = " 2 "

$deux.Location = ‘140,70’

$MainForm.Controls.Add($deux)


<# Création du bouton 3 #>
$trois = New-Object System.Windows.Forms.Button

$trois.Text = " 3 "

$trois.Location = ‘220,70’

$MainForm.Controls.Add($trois)


<# Création du bouton 4 #>
$quatre = New-Object System.Windows.Forms.Button

$quatre.Text = " 4 "

$quatre.Location = ‘60, 100’

$MainForm.Controls.Add($quatre)


<# Création du bouton 5 #>
$cinq = New-Object System.Windows.Forms.Button

$cinq.Text = " 5 "

$cinq.Location = ‘140,100’

$MainForm.Controls.Add($cinq)


<# Création du bouton 6 #>
$six = New-Object System.Windows.Forms.Button

$six.Text = " 6 "

$six.Location = ‘220, 100’

$MainForm.Controls.Add($six)


<# Création du bouton 7 #>
$sept = New-Object System.Windows.Forms.Button

$sept.Text = " 7 "

$sept.Location = ‘60, 130’

$MainForm.Controls.Add($sept)


<# Création du bouton 8 #>
$huit = New-Object System.Windows.Forms.Button

$huit.Text = " 8 "

$huit.Location = ‘140, 130’

$MainForm.Controls.Add($huit)


<# Création du bouton 9 #>
$neuf = New-Object System.Windows.Forms.Button

$neuf.Text = " 9 "

$neuf.Location = ‘220,130’

$MainForm.Controls.Add($neuf)
 

<# Création de bouton pour les nombres #>
<#
for ($i = 0; $i -ge 9; $i++) {
    $btn = New-Object System.Windows.Forms.Button

    $btn.Name = btn-$i
    $btn.Text = $i
    $btn.Location = New System.Drawing.Point($x, $y)
    $btn.Size = New System.Drawing.Size(15, 20)

    $MainForm.Controls.Add($btn)
}

#>

<# Création du bouton + #>
$plus = New-Object System.Windows.Forms.Button

$plus.Text = " + "

$plus.Location = ‘180,190’

$MainForm.Controls.Add($plus)


<# Création du bouton - #>
$moins = New-Object System.Windows.Forms.Button

$moins.Text = " - "
$moins.Location = ‘100,190’

$MainForm.Controls.Add($moins)

<# Création du bouton * #>
$fois = New-Object System.Windows.Forms.Button

$fois.Text = " * "
$fois.Location = ‘180,220’

$MainForm.Controls.Add($fois)

<# Création du bouton / #>
$diviser = New-Object System.Windows.Forms.Button

$diviser.Text = " / "
$diviser.Location = ‘100,220’

$MainForm.Controls.Add($diviser)

<# Création du bouton = #>
$egal = New-Object System.Windows.Forms.Button

$egal.Text = " = "
$egal.Location = ‘140,250’

$MainForm.Controls.Add($egal)

<# Création de la textbox #>
$textbox = New-Object System.Windows.Forms.textbox

$textbox.Text = " "
$textbox.Location = ‘130,40’

$MainForm.Controls.Add($textbox)


<# Affichage de la page #>
$MainForm.ShowDialog()