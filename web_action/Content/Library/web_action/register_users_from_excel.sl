namespace: web_action
flow:
  name: register_users_from_excel
  inputs:
    - excel_path: "C:\\Users\\Administrator\\Desktop\\users.xlsx"
    - sheet: Sheet1
    - login_header: Username
    - password_header: Password
    - name_header: Full Name
    - email_header: Email
  workflow:
    - Get_Cell:
        do_external:
          5060d8cc-d03c-43fe-946f-7babaaec589f:
            - excelFileName: '${excel_path}'
            - worksheetName: '${sheet}'
            - hasHeader: 'yes'
            - firstRowIndex: '0'
            - rowIndex: '0:1000'
            - columnIndex: '0:100'
            - rowDelimiter: '|'
            - columnDelimiter: ','
            - password_header: '${password_header}'
            - email_header: '${email_header}'
            - name_header: '${name_header}'
            - login_header: '${login_header}'
        publish:
          - data: '${returnResult}'
          - header
          - login_index: "${str(header.split(',').index(login_header))}"
          - password_index: "${str(header.split(',').index(password_header))}"
          - email_index: "${str(header.split(',').index(email_header))}"
          - name_index: "${str(header.split(',').index(name_header))}"
        navigate:
          - failure: on_failure
          - success: register_account_flow
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
      Get_Cell:
        x: 160
        'y': 320
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
