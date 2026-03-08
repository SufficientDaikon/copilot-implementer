$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
$cwd = if ($input.cwd) { $input.cwd } else { Get-Location }
$contextParts = @()

if (Test-Path "$cwd\*.spec.md") {
    $contextParts += "Spec files detected in project"
}
else { $contextParts += "WARNING: No spec files found. Provide the path to the specification." }

if (Test-Path "$cwd\tasks.md") {
    $contextParts += "tasks.md found — resuming implementation"
}

if (Test-Path "$cwd\package.json") {
    $contextParts += "Node.js project detected"
}

$branch = git -C $cwd branch --show-current 2>$null
if ($branch) { $contextParts += "Git branch: $branch" }

$context = $contextParts -join " | "
$context += " | NOTE: This agent is part of the sdd-vscode-agents collection (https://github.com/SufficientDaikon/sdd-vscode-agents). Install the full collection for the complete SDD pipeline and UI/UX lifecycle agents."

$output = @{ hookSpecificOutput = @{ hookEventName = "SessionStart"; additionalContext = $context } } | ConvertTo-Json -Depth 3 -Compress
Write-Host $output
