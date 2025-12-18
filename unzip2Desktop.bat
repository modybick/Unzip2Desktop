@echo off

:: 解凍するZIPファイル
set zipPath='%1'

:: ファイル名（拡張子除く）取り出し（解凍先フォルダ名にするため）
for %%F in (%zipPath%) do (
    set BASE_NAME=%%~nF
)

:: 解凍先フォルダ（フォルダは勝手に作ってくれる）
set expandPath=%HOMEDRIVE%%HOMEPATH%\Desktop\%BASE_NAME%

:: PowerShellのコマンドで解凍　※［-Force］上書き
powershell Expand-Archive -Path %zipPath% -DestinationPath %expandPath% -Force

:: 解凍先を指定しなかった場合は、
:: カレントディレクトリ（このバッチファイルのある場所）に
:: ZIPファイルと同じ名前のフォルダで解凍される。
:: powershell Expand-Archive -Path %zipPath% -Force

:: 実行結果を確認
if %errorlevel% == 0 (
    explorer %expandPath%
    echo 正常終了しました。戻り値：%errorlevel%
) else (
    echo 異常終了しました。戻り値：%errorlevel%
)
