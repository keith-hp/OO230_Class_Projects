namespace: Expressions
operation:
  name: create_excel_doc
  inputs:
    - file_name
    - sheet_name: sheet1
    - header_data
  python_action:
    use_jython: false
    script: |-
      import openpyxl
      from openpyxl import Workbook
      def execute(file_name, sheet_name, header_data):
          wb = Workbook()
          sheet = wb.active
          if (sheet_name is None):
              sheet_name = 'Sheet1'
          sheet.title = sheet_name
          if (header_data is not None):
              sheet.append(eval(header_data))
          wb.save(file_name)
  results:
    - SUCCESS
