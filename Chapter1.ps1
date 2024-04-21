# Chapter 1 - Coding Guidelines

#region Tabs vs Spaces

function Foo {
	If ( $True ) {
		write-host "Number   Name   Description"
        write-host "     3  Three   The number after 2"
		write-host "     4   Four   THe number before 5"
    }
}
#endregion

#region Example of Bad Coding

function foo-bar {

    type -encoding ASCII ` 
        'c:\forbar.txt'

}

#endregion

#region Example of Good Coding

function Get-FooBar { 
	get-content -encoding ASCII -path 'c:\foobar.txt'
}

#endregion