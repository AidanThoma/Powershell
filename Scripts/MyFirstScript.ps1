$pi = 3.141592653589793238462643383279
$e = 2.71828

"`nPi is $pi"
"The first number of pi is {0:N0}" -f $pi
"The first two digits of pi are {0:N2}" -f $pi
"The first 12 digits of pi are {0:N12}" -f $pi

"`nEulers number is $e"
"The first number of eulers number is {0:N0}" -f $e
"The first two digits of eulers number are {0:N2}" -f $e
"The firt five digits of eulers number are {0:N5}" -f $e


Start-Sleep -Seconds 3
clear

$firstName = "Quinn"
$lastName = "Ertz"

"`nMy friends first name is $firstName and his last name is $lastName"

Start-Sleep -Seconds 3
clear
$i = 0
while ($i -lt 100) {
    $i += 1
    Write-Host ("The value of i is {0}" -f $i)
}
