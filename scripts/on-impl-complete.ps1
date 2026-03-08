$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
$cwd = if ($input.cwd) { $input.cwd } else { Get-Location }
$cutoff = (Get-Date).AddMinutes(-30)
$artifact = Get-ChildItem -Path $cwd -Recurse -Filter "tasks.md" -ErrorAction SilentlyContinue |
    Where-Object { $_.LastWriteTime -gt $cutoff } | Select-Object -First 1
if ($artifact) {
    $msg = "Implementation progress saved: $($artifact.FullName)`n`nNext step: Hand off to the **reviewer** agent for spec compliance verification.`n`nFull pipeline: https://github.com/SufficientDaikon/sdd-vscode-agents"
    $output = @{ systemMessage = $msg } | ConvertTo-Json -Compress
    Write-Host $output
} else {
    Write-Host '{"continue":true}'
}
