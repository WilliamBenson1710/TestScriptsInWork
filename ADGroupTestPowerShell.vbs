bacpac

\\Delolyut11002\it\DataTeam\WorldWideImporters.bacpac

Get-ADGroup -filter * -SearchBase "OU=Operations,DC=dcyf,DC=wa,DC=lcl" -Properties *

Get-ADGroup -filter * -SearchBase "OU=Operations,DC=dcyf,DC=wa,DC=lcl" -Properties "samaccountname","DisplayName","Name","SID","distinguishedName" | Select-Object -Property "samaccountname","DisplayName","Name","SID","distinguishedName"

Get-ADGroupMember -identity  S-1-5-21-1645379729-1712154184-1921145505-10133 | Select-Object -Property "samaccountname","SID","distinguishedName","DisplayName" 

$adserver = "mydomain.com"
$outputFile = "C:\FileTransfer\myad.txt"
if (test-path $outputFile)
{
    remove-item $outputFile
}


$groups = Get-ADGroup -SearchBase "OU=Operations,DC=dcyf,DC=wa,DC=lcl" -filter * -Properties members
foreach($group in $groups)
{

    foreach($member in $group.members)
    {
        $user = get-aduser $member -ErrorAction SilentlyContinue
        $newLine = "$($group.SamAccountName)`t$($user.SamAccountName)"
        add-content $outputFile  $newLine
    }
}

$users = get-adgroupmember -identity  S-1-5-21-1645379729-1712154184-1921145505-6865 | Select-Object  SamAccountName, Name | Sort-Object name 
$logfile = "C:\FileTransfer\OutFile.csv"
add-content $logfile "AccountName,UserName,GroupName"
 
foreach($user in $users){
    $groups =GET-ADUser -Identity $user.SamAccountName  –Properties MemberOf | `
    Select-Object -ExpandProperty MemberOf | `
    Get-ADGroup -Properties name | `
    Sort-Object name | `
    Where-Object { $_.GroupCategory -eq "Security"}|`
    Where-Object {$_.name -like "*SQL*"}|` # An additional filter
    Select-Object name
    foreach($group in $groups){
        $outline = "{0},{1},{2}" -f $user.SamAccountName, $user.Name, $group.name
        add-content $logfile $outline
    }
}

Get-ADGroup -filter * -server 'DSHS.WA.LCL' -SearchBase "OU=Operations,DC=dshs,DC=wa,DC=lcl" -Properties "samaccountname","SID","distinguishedName","DisplayName","Name" | Select-Object -Property "samaccountname","SID","distinguishedName","DisplayName","Name"



Using variable substitution syntax
Scope

By environments

By target roles

By targets

Name
Value
Scope
Source
Database Users


Credential.Attendance_Reporting.Password

EnterpriseAX Database Servers DSC

username	DCYF\svcdcyffmlnkintqa2

CAF.FEDS.CAF.030.WTPY.RESPONSE.txt
CAF.FEDS.CAF.030.WTPY.RESPONSE.txt
                                
dcyf.wa.lcl/Operations/Groups/Resource/Database/G-S-DCYF-Acorn Developers


get-adgroup -Filter * -SearchBase "OU=Operations,DC=dcyf,DC=wa,DC=lcl"  | %{Get-ADGroupMember $_.name} | ft name

Get-ADGroup -filter * -SearchBase "OU=Operations,DC=dcyf,DC=wa,DC=lcl" -Properties "samaccountname","SID","distinguishedName" | Select-Object -Property "samaccountname","SID","distinguishedName"




Get-ADGroupMember -identity  S-1-5-21-1645379729-1712154184-1921145505-6865 | Select-Object -Property *
