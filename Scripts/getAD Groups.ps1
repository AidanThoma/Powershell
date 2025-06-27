$firstName = "*Aidan*"

#   Filter User is for filtering basic things such as first name, last name, ect
#   Search base is used for more complicated stuff such as grouping (you need DC=drake, DC=edu)
$students = Get-ADUser -Filter 'GivenName -like $firstName' -SearchBase "OU=Students, DC=drake,DC=edu" -Server "drake.edu"
$total =  Get-ADUser -Filter 'GivenName -like $firstName' -Server "drake.edu"


#   Use Get-ADPrincipalGroupMembership to get group membership
<#
foreach($student in $students) {
    Get-ADPrincipalGroupMembership -Identity $user -Server "drake.edu"
}
#>

Write-Host "There are $($students.count) students and $($total.count - $students.count) staff or factualty
Total: $($total.count)"
# $users | Select-Object DistinguishedNames