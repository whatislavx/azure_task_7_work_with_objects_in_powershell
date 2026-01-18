$targetSizeName = "Standard_B2pts_v2"
$files = Get-ChildItem -Path ".\data" -Filter "*.json"

$results = foreach ($file in $files) {
    $objectFile = Get-Content $file.FullName | ConvertFrom-Json

    if ($objectFile.Name -eq $targetSizeName) {
        $file.BaseName
    }
}

$results | ConvertTo-Json | Out-File -FilePath ".\result.json" -Encoding utf8