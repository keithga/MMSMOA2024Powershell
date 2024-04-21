#region bad code

# Add a new user to Active Directory.

# FILL IN THIS SECTION HERE
$NewLocalUser = @{
    Name = 'KeithGa123'
    AccountNeverExpires = $true
    PasswordNeverExpires = $true
    Description = 'Local account for user'
    FullName = 'Keith Garner123'
    Password = ConvertTo-SecureString -AsPlainText -Force -String '%k#oC8,kH6r,Fw8!F'
}
# END FILL IN SECTION
$newUser = new-localuser @NewLocalUser

#endregion

#region better code

$path = 'd:\import\NewUserData.csv'
$users = import-csv -Delimiter ',' -Path $path

foreach ( $user in $users ) {
    $NewLocalUser = @{
        Name = $user.Name
        AccountNeverExpires = $true
        PasswordNeverExpires = $true
        Description = $user.Description
        FullName = $user.FullName
        Password = new-RandomPassword
    }

    $newUser = new-localuser @NewLocalUser
    "User [$NewUser.name] has new password: [$($NewLocalUser.Password)]" | write-output
}

#endregion

#region Best code

$path = 'd:\import\NewUserData.csv'
$users = import-csv -Delimiter ',' -Path $path

foreach ( $user in $users ) {
    $NewLocalUser = @{
        Name = $user.Name
        AccountNeverExpires = $true
        PasswordNeverExpires = $true
        Description = $user.Description
        FullName = $user.FullName
        Password = new-RandomPassword
    }

    $newUser = new-localuser @NewLocalUser
    
    set-userMustChangePassword -user $newUser
    "User [$NewUser.name] has new password: [$($NewLocalUser.Password)]" | write-output
}

#endregion