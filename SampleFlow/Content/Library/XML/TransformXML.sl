namespace: XML
flow:
  name: TransformXML
  workflow:
    - validate:
        do:
          io.cloudslang.base.xml.validate:
            - xml_document: "C:\\OOLabs\\books.xml"
            - xml_document_source: xmlPath
        publish:
          - validated_xml_document: '${xml_document}'
        navigate:
          - SUCCESS: convert_to_html
          - FAILURE: on_failure
    - convert_to_html:
        do:
          io.cloudslang.base.xml.apply_xsl_transformation:
            - xml_document: '${validated_xml_document}'
            - xsl_template: "C:\\OOLabs\\books.xsl"
            - output_file: "C:\\OOLabs\\books.html"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      validate:
        x: 360
        'y': 200
      convert_to_html:
        x: 600
        'y': 440
        navigate:
          41626398-f1f6-9e57-88c9-eef87adf2e14:
            targetId: 20bcd25a-1de3-035a-69fe-46a5e2ac2f7d
            port: SUCCESS
    results:
      SUCCESS:
        20bcd25a-1de3-035a-69fe-46a5e2ac2f7d:
          x: 600
          'y': 240
