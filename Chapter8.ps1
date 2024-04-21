$range = 1..1000

Measure-Command {
    $array = @()
    foreach ($item in $range){
        $array += $item
    }
} | Select-Object -ExpandProperty TotalMilliseconds

Measure-Command {
    $list  = New-Object -TypeName System.Collections.Generic.List[int]
    foreach ($item in $range){
        $list.add($item)
    }
} | Select-Object -ExpandProperty TotalMilliseconds 

# $percent = $item * 100 / $range[-1]
# if ( $item % 1000 -eq 0 ) { write-progress -Activity "Working: $Item   at $percent% " -PercentComplete $percent }

# write-progress -Activity "done" -Completed

