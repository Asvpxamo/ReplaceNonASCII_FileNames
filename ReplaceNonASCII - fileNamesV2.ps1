# Prompt the user to enter the directory path
$path = Read-Host "Enter the directory path (include quotes if the path contains spaces)"

# Remove any quotes from the path
$path = $path -replace '"', ''

# Get all items in the specified directory and its subdirectories recursively
$items = Get-ChildItem -Path $path -Recurse

$totalSurveys = $items.Count / 2
$renamedItems = 0

# Iterate through each item
foreach ($item in $items) {
    # Replace special characters with their corresponding regular ones
    $newName = $item.Name.Replace("é", "e").Replace("è", "e").Replace("ô", "o").Replace("ö", "o").Replace("à", "a").Replace("î", "i").Replace("ë", "e").Replace("ç", "c").Replace("ê", "e").Replace("ü", "u").Replace("â", "a").Replace("ù", "u").Replace("û", "u").Replace("ï", "i").Replace("ä", "a").Replace("É", "E").Replace("È", "E").Replace("Ô", "O").Replace("Ö", "O").Replace("À", "A").Replace("Î", "I").Replace("Ë", "E").Replace("Ç", "C").Replace("Ê", "E").Replace("Ü", "U").Replace("Â", "A").Replace("Ù", "U").Replace("Û", "U").Replace("Ï", "I").Replace("Ä", "A").Replace("Ã€", "A").Replace("Ã", "A").Replace("Ã‚", "A").Replace("Ãƒ", "A").Replace("\u00C4", "A").Replace("Ã…", "A").Replace("Ã†", "AE").Replace("Ã‡", "C").Replace("Ãˆ", "E").Replace("Ã‰", "E").Replace("ÃŠ", "E").Replace("Ã‹", "E").Replace("ÃŒ", "I").Replace("Ã", "I").Replace("ÃŽ", "I").Replace("Ã", "I").Replace("Ã", "D").Replace("Ã‘", "N").Replace("Ã’", "O").Replace("\00C4", "O").Replace("\u00D4", "O").Replace("Ã•", "O").Replace("Ã–", "O").Replace("Ã—", "x").Replace("Ã˜", "O").Replace("Ã™", "U").Replace("Ãš", "U").Replace("Ã›", "U").Replace("Ãœ", "U").Replace("Ã", "Y").Replace("Ãž", "Th").Replace("ÃŸ", "ss").Replace("Ã", "a").Replace("Ã¡", "a").Replace("Ã¢", "a").Replace("Ã£", "a").Replace("Ã¤", "a").Replace("Ã¥", "a").Replace("Ã¦", "ae").Replace("Ã§", "c").Replace("Ã¨", "e").Replace("Ã©", "e").Replace("Ãª", "e").Replace("Ã«", "e").Replace("Ã¬", "i").Replace("Ã­", "i").Replace("Ã®", "i").Replace("Ã¯", "i").Replace("Ã°", "d").Replace("Ã±", "n").Replace("Ã²", "o").Replace("Ã³", "o").Replace("Ãµ", "o").Replace("Ã¶", "o").Replace("Ã·", "÷").Replace("Ã¸", "o").Replace("Ã¹", "u").Replace("Ãº", "u").Replace("Ã»", "u").Replace("Ã¼", "u").Replace("Ã½", "y").Replace("Ã¾", "th").Replace("Ã¿", "y")
    
    # Check if the new name is different from the old one
    if ($newName -ne $item.Name) {
        # Rename the item   
        Rename-Item -Path $item.FullName -NewName $newName
        $renamedItems++
        Write-Host "Renamed item:"
        Write-Host "$($item.Name) ->"
        Write-Host "$($newName)"
        Write-Host "----------------------"
        Write-Host ""
    }
}

Write-Host "Total surveys processed: $totalSurveys"
Write-Host "Items patched: $renamedItems"

# Prompt user to press Enter to close the script
Write-Host "Press Enter to exit..."
$null = Read-Host