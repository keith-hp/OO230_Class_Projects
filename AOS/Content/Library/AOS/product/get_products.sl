namespace: AOS.product
flow:
  name: get_products
  inputs:
    - aos_url: 'http://aos:8082'
    - file_path: "c:\\temp\\products.xlsx"
  workflow:
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: '${aos_url+"/catalog/api/v1/categories/all_data"}'
        publish:
          - json: '${return_result}'
        navigate:
          - SUCCESS: is_excel
          - FAILURE: on_failure
    - write_header:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: '${file_path}'
            - text: "${'+'+'+'.join([''.center(13,'-'),''.center(15,'-'),''.center(12,'-'),''.center(51,'-'),''.center(15,'-'),''.center(60,'-')])+'+\\n'+\\\n'|'+'|'.join(['Category ID'.center(13),'Category Name'.center(15),'Product ID'.center(12),'Product Name'.center(51),'Product Price'.center(15),'Color Codes'.center(60)])+'|\\n'+\\\n'+'+'+'.join([''.center(13,'-'),''.center(15,'-'),''.center(12,'-'),''.center(51,'-'),''.center(15,'-'),''.center(60,'-')])+'+\\n'}"
        navigate:
          - SUCCESS: get_categories
          - FAILURE: on_failure
    - get_categories:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '$.*.categoryId'
        publish:
          - category_id_list: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: iterate_categories
          - FAILURE: on_failure
    - iterate_categories:
        loop:
          for: category_id in category_id_list
          do:
            AOS.product.iterate_categories:
              - json: '${json}'
              - category_id: '${category_id}'
              - file_path: '${file_path}'
          break:
            - FAILURE
        navigate:
          - FAILURE: FAILURE_1
          - SUCCESS: SUCCESS
          - FAILURE_1: FAILURE_1
    - is_excel:
        do:
          io.cloudslang.base.utils.is_true:
            - bool_value: '${str(file_path.endswith("xls") or file_path.endswith("xlsx"))}'
        navigate:
          - 'TRUE': delete
          - 'FALSE': write_header
    - delete:
        do:
          io.cloudslang.base.filesystem.delete:
            - source: '${file_path}'
        navigate:
          - SUCCESS: create_excel_file
          - FAILURE: create_excel_file
    - create_excel_file:
        do:
          io.cloudslang.base.excel.create_excel_file:
            - excel_file_name: '${file_path}'
            - worksheet_names: products
        navigate:
          - SUCCESS: get_categories
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
    - FAILURE_1
extensions:
  graph:
    steps:
      http_client_get:
        x: 80
        'y': 240
      write_header:
        x: 520
        'y': 360
      get_categories:
        x: 920
        'y': 360
      iterate_categories:
        x: 1120
        'y': 360
        navigate:
          44f74107-1468-8747-a847-9c8f650a6e28:
            targetId: a8472ee7-e108-b44b-4aa5-818a129be87c
            port: SUCCESS
          1da002fa-06dc-9fd4-5516-70548fe34c71:
            targetId: b3365f5e-64b3-77d8-2f34-78671e63a698
            port: FAILURE
          2010ec1e-3c9d-63ff-2f59-c53de6f5ecdf:
            targetId: b3365f5e-64b3-77d8-2f34-78671e63a698
            port: FAILURE_1
      is_excel:
        x: 280
        'y': 240
      delete:
        x: 520
        'y': 200
      create_excel_file:
        x: 880
        'y': 200
    results:
      SUCCESS:
        a8472ee7-e108-b44b-4aa5-818a129be87c:
          x: 1280
          'y': 280
      FAILURE_1:
        b3365f5e-64b3-77d8-2f34-78671e63a698:
          x: 1280
          'y': 560
