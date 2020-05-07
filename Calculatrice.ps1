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

<#

# Demande à l'utilisateur les valeurs
[uint16]$premierNombre =  Read-Host -Prompt "Entrez votre premier chiffre";
[uint16]$deuxiemeNombre =  Read-Host -Prompt "Entrez votre deuxième chiffre";
[string]$operateur = Read-Host -Prompt "Entrez votre opérateur (+, -, /, *)";

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
        Clear-Variable -Name "Resultat";
    }
}

# Ecrit le résultat
if($Resultat)
{
    Write-Host "Résultats : $premierNombre $operateur $deuxiemeNombre = $Resultat";
}

#>















$x = 60
$y = 100

<# Création de bouton pour les nombres #>
for ($i = 0; $i -ge 9; $i++) {
    $btn = New-Object System.Windows.Forms.Button

    $btn.Name = btn-$i
    $btn.Text = $i
    $btn.Location = New System.Drawing.Point($x, $y)
    $btn.Size = New System.Drawing.Size(15, 20)

    $MainForm.Controls.Add($btn)
}

<# Création du bouton + #>
$plus = New-Object System.Windows.Forms.Button

$plus.Text = " + "

$plus.Location = ‘180,200’

$MainForm.Controls.Add($plus)


<# Création du bouton - #>
$moins = New-Object System.Windows.Forms.Button

$moins.Text = " - "
$moins.Location = ‘100,200’

$MainForm.Controls.Add($moins)

<# Création du bouton * #>
$fois = New-Object System.Windows.Forms.Button

$fois.Text = " * "
$fois.Location = ‘180,170’

$MainForm.Controls.Add($fois)

<# Création du bouton / #>
$diviser = New-Object System.Windows.Forms.Button

$diviser.Text = " / "
$diviser.Location = ‘100,170’

$MainForm.Controls.Add($diviser)

<# Création du bouton = #>
$egal = New-Object System.Windows.Forms.Button

$egal.Text = " = "
$egal.Location = ‘140,250’

$MainForm.Controls.Add($egal)

<# Création du bouton = #>
$egal = New-Object System.Windows.Forms.textbox

$egal.Text = " "
$egal.Location = ‘140,50’

$MainForm.Controls.Add($egal)

<# Affichage de la page #>
$MainForm.ShowDialog()