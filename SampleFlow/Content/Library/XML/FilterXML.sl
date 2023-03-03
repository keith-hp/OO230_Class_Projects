namespace: XML
flow:
  name: FilterXML
  workflow:
    - validate:
        do:
          io.cloudslang.base.xml.validate:
            - xml_document: "C:\\OOLabs\\XMLSample.xml"
            - xml_document_source: xmlPath
        publish:
          - validated_xml_document: '${xml_document}'
        navigate:
          - SUCCESS: xpath_query
          - FAILURE: on_failure
    - xpath_query:
        do:
          io.cloudslang.base.xml.xpath_query:
            - xml_document: '${validated_xml_document}'
            - xml_document_source: xmlPath
            - xpath_query:
                prompt:
                  type: text
        publish:
          - selected_value
        navigate:
          - SUCCESS: Display_Message
          - FAILURE: on_failure
    - Display_Message:
        do_external:
          434e6fa2-26bc-4e84-9e1f-0aa6946cf920:
            - message: '${selected_value}'
        navigate:
          - success: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      validate:
        x: 360
        'y': 200
      xpath_query:
        x: 520
        'y': 360
      Display_Message:
        x: 760
        'y': 400
        navigate:
          0e0251c6-dbf3-0551-a770-0a94c2e0a1f0:
            targetId: 20bcd25a-1de3-035a-69fe-46a5e2ac2f7d
            port: success
    results:
      SUCCESS:
        20bcd25a-1de3-035a-69fe-46a5e2ac2f7d:
          x: 600
          'y': 240
