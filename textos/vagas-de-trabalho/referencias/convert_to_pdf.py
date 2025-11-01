#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Script para converter Markdown para PDF"""

import markdown
import sys
import os
from pathlib import Path

# Tentar importar bibliotecas PDF (opcional)
HAS_WEASYPRINT = False
HAS_PDFKIT = False

# Comentado para evitar erros - vamos usar apenas HTML
# try:
#     from weasyprint import HTML
#     HAS_WEASYPRINT = True
# except ImportError:
#     pass
# try:
#     import pdfkit
#     HAS_PDFKIT = True
# except ImportError:
#     pass

def convert_md_to_pdf(input_file, output_file):
    """Converte arquivo Markdown para HTML formatado para PDF"""
    
    # Ler o arquivo Markdown
    with open(input_file, 'r', encoding='utf-8') as f:
        md_content = f.read()
    
    # Converter Markdown para HTML
    html_body = markdown.markdown(md_content, extensions=['extra', 'codehilite'])
    
    # Criar HTML completo com estilos otimizados para impressão
    html_content = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Currículo - Bolívar Alencastro</title>
        <style>
            @media print {{
                @page {{
                    margin: 1.5cm;
                    size: A4;
                }}
                body {{
                    margin: 0;
                    padding: 0;
                }}
            }}
            body {{
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
                line-height: 1.6;
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                color: #333;
                background: white;
            }}
            h1 {{
                color: #2c3e50;
                border-bottom: 3px solid #3498db;
                padding-bottom: 10px;
                margin-top: 0;
                page-break-after: avoid;
            }}
            h2 {{
                color: #34495e;
                margin-top: 30px;
                border-bottom: 2px solid #ecf0f1;
                padding-bottom: 5px;
                page-break-after: avoid;
            }}
            h3 {{
                color: #555;
                margin-top: 25px;
                page-break-after: avoid;
            }}
            a {{
                color: #3498db;
                text-decoration: none;
            }}
            a:hover {{
                text-decoration: underline;
            }}
            ul, ol {{
                margin-left: 20px;
                margin-bottom: 15px;
            }}
            li {{
                margin-bottom: 8px;
            }}
            code {{
                background-color: #f4f4f4;
                padding: 2px 5px;
                border-radius: 3px;
                font-family: 'Courier New', monospace;
            }}
            strong {{
                color: #2c3e50;
                font-weight: 600;
            }}
            hr {{
                border: none;
                border-top: 1px solid #ecf0f1;
                margin: 20px 0;
                page-break-after: avoid;
            }}
            p {{
                margin-bottom: 12px;
            }}
        </style>
    </head>
    <body>
        {html_body}
    </body>
    </html>
    """
    
    # Salvar HTML otimizado para impressão
    html_file = output_file.replace('.pdf', '.html')
    with open(html_file, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"[OK] HTML criado: {html_file}")
    print("\nPara converter para PDF:")
    print("   1. Abra o arquivo HTML no seu navegador")
    print("   2. Pressione Ctrl+P (ou Cmd+P no Mac)")
    print("   3. Selecione 'Salvar como PDF' como destino")
    print("   4. Clique em 'Salvar'")
    print(f"\n   Arquivo: {os.path.abspath(html_file)}")
    
    return html_file

if __name__ == "__main__":
    input_file = "afya-product-designer-senior-curriculum-bolivar-alencastro.md"
    output_file = "afya-product-designer-senior-curriculum-bolivar-alencastro.pdf"
    
    if not os.path.exists(input_file):
        print(f"❌ Arquivo não encontrado: {input_file}")
        sys.exit(1)
    
    convert_md_to_pdf(input_file, output_file)

