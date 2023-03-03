namespace: web_action
flow:
  name: register_users_from_excel_CloudSlang
  inputs:
    - excel_path: "C:\\Users\\Administrator\\Desktop\\users.xlsx"
    - sheet: Sheet1
    - login_header: Username
    - password_header: Password
    - name_header: Full Name
    - email_header: Email
  workflow:
    - get_cell_2:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${excel_path}'
            - worksheet_name: '${sheet}'
            - has_header: 'yes'
            - first_row_index: '0'
            - row_index: '0:1000'
            - email_header: '${email_header}'
            - login_header: '${login_header}'
            - password_header: '${password_header}'
            - name_header: '${name_header}'
        publish:
          - data: '${return_result}'
          - header
          - login_index: "${str(header.split(',').index(login_header))}"
          - password_index: "${str(header.split(',').index(password_header))}"
          - email_index: "${str(header.split(',').index(email_header))}"
          - name_index: "${str(header.split(',').index(name_header))}"
        navigate:
          - SUCCESS: register_account_flow
          - FAILURE: on_failure
    - register_account_flow:
        loop:
          for: 'row in data.split("|")'
          do:
            web_action.register_account_flow:
              - username: '${row.split(",")[int(login_index)]}'
              - password: '${row.split(",")[int(password_index)]}'
              - first_name: '${row.split(",")[int(name_index)].split()[0]}'
              - last_name: '${row.split(",")[int(name_index)].split()[-1]}'
              - email: '${row.split(",")[int(email_index)]}'
          break:
            - FAILURE
          publish:
            - error_message
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_cell_2:
        x: 160
        'y': 160
      register_account_flow:
        x: 520
        'y': 320
        navigate:
          747640c6-76fd-8e29-d89c-985be4db2ad0:
            targetId: 94f60e8f-5665-4b9d-48cd-63cf74cc9868
            port: SUCCESS
    results:
      SUCCESS:
        94f60e8f-5665-4b9d-48cd-63cf74cc9868:
          x: 840
          'y': 320
