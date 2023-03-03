namespace: flowAuthoring
flow:
  name: CheckPostgresStatus
  workflow:
    - check_postgres_is_up:
        do:
          io.cloudslang.postgresql.windows.utils.check_postgres_is_up:
            - hostname:
                prompt:
                  type: text
            - hostname_port: '5985'
            - hostname_protocol: http
            - username:
                value: null
                sensitive: true
                prompt:
                  type: text
            - password:
                value: null
                sensitive: true
                prompt:
                  type: text
            - service_name:
                prompt:
                  type: text
        publish:
          - processID: '${process_id}'
        navigate:
          - SUCCESS: Display_Message
          - FAILURE: on_failure
    - Display_Message:
        do_external:
          434e6fa2-26bc-4e84-9e1f-0aa6946cf920:
            - message: '${"The postgres process ID IS: " + processID}'
        navigate:
          - success: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      check_postgres_is_up:
        x: 280
        'y': 200
      Display_Message:
        x: 480
        'y': 200
        navigate:
          3aeaaf50-5004-a9fd-5f9c-eff9959e4350:
            targetId: 14bfc06f-5742-b88c-26f2-1944dcd2b2d9
            port: success
    results:
      SUCCESS:
        14bfc06f-5742-b88c-26f2-1944dcd2b2d9:
          x: 680
          'y': 280
