namespace: flowAuthoring
flow:
  name: Get_Local_IP_Address
  workflow:
    - run_command:
        do:
          io.cloudslang.base.cmd.run_command:
            - command: ipconfig
        publish:
          - ip_address: "${cs_regex(return_result,\"Address.* (\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})\")}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      run_command:
        x: 360
        'y': 120
        navigate:
          18cd3ea6-451f-fe94-5ab2-5cbc92722462:
            targetId: bd8005f1-a48a-e431-c267-ace2f628ccb3
            port: SUCCESS
    results:
      SUCCESS:
        bd8005f1-a48a-e431-c267-ace2f628ccb3:
          x: 520
          'y': 120
