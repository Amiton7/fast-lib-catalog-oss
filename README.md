# fast-lib-catalog-oss

End-to-end open-source pipeline for fast library cataloging using OCR & open models.

## Synopsis

1. ingest images or video  
2. detect and crop book spines  
3. OCR (Marathi, Hindi, English)  
4. parse titles/authors via open LLM  
5. transliterate Devanagari → Latin  
6. lookup metadata (OpenLibrary, Google Books)  
7. append to Google Sheets  
