@echo off
@title CSDNExporter - Shepherd Zhu's Fork
@CHCP 65001
@cls
@color 9F
@echo ================================================================================
@echo ^|^|=================== CSDNExporter（Windows版本） ==========================^|^|
@echo ^|^|=================== Shepherd Zhu's Fork ==========================^|^|
@echo ^|^|============= Github链接：https://github.com/axzml/CSDNExporter ==============^|^|
@echo ================================================================================

set /p download_category="Download a category? (true/false): "
if "%download_category%"=="true" (
    set /p category_url="Enter the category URL: "
    set /p start_page="Enter the start page: "
    set /p page_num="Enter the number of pages to download: "
) else (
    set /p article_url="Enter the article URL: "
)

set markdown_dir=markdown
set pdf_dir=pdf\

echo "Downloading..."

if "%download_category%"=="true" (
    python -u main.py ^
        --category_url "%category_url%" ^
        --start_page %start_page% ^
        --page_num %page_num% ^
        --markdown_dir %markdown_dir% ^
        --pdf_dir %pdf_dir% ^
        --combine_together ^
        --to_pdf ^
        --is_win 1
        @REM --with_title ^
        @REM --rm_cache
) else (
    python -u main.py ^
        --article_url "%article_url%" ^
        --markdown_dir %markdown_dir% ^
        --pdf_dir %pdf_dir% 
        --to_pdf ^
        --with_title ^
        --rm_cache ^
        --combine_together
        --is_win 1
)

pause
