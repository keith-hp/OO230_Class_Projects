namespace: Expressions
flow:
  name: cr_doc_flow
  workflow:
    - create_excel_doc:
        do:
          Expressions.create_excel_doc:
            - file_name: "c:\\temp\\file.xlsx"
            - header_data: '["column1","column2"]'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      create_excel_doc:
        x: 320
        'y': 320
        navigate:
          53b35841-b7d2-ae0c-64d2-0b72eb4de7cd:
            targetId: 50d69b5d-7397-7e88-dbd1-be3c21024706
            port: SUCCESS
    results:
      SUCCESS:
        50d69b5d-7397-7e88-dbd1-be3c21024706:
          x: 520
          'y': 320
