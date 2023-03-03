namespace: flowAuthoring
flow:
  name: DisplayMessage
  workflow:
    - Display_Message:
        do_external:
          434e6fa2-26bc-4e84-9e1f-0aa6946cf920:
            - message:
                prompt:
                  type: text
        navigate:
          - success: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Display_Message:
        x: 600
        'y': 280
        navigate:
          3d127e1c-ac17-d716-6bda-db773bbddaf9:
            targetId: af4ad69e-cfd4-50d4-c2da-de3c12426faa
            port: success
    results:
      SUCCESS:
        af4ad69e-cfd4-50d4-c2da-de3c12426faa:
          x: 800
          'y': 280
