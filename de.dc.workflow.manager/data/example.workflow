<?xml version="1.0" encoding="ASCII"?>
<workflow:WorkflowManager xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:workflow="http://www.frateranatis.org/fx/emf/workflow">
  <workflows content="Replacement Examples">
    <operations xsi:type="workflow:Clipboard" name="Hello Clipboard" content="Hello Clipboard"/>
    <operations xsi:type="workflow:Clipboard" name="Hello Clipboard with Replacement" content="Hello Clipboard %REPLACEMENT% - %REPLACEMENT%">
      <replacements variable="%REPLACEMENT%">
        <replacer value="Testing"/>
      </replacements>
    </operations>
    <operations xsi:type="workflow:Clipboard" name="Hello Clipboard with Input Replacement" content="Hello Clipboard %REPLACEMENT%">
      <replacements variable="%REPLACEMENT%">
        <replacer xsi:type="workflow:InputReplacer" title="Input Dialog" message="Please give a message"/>
      </replacements>
    </operations>
  </workflows>
  <workflows content="Files &amp; Folder">
    <operations xsi:type="workflow:Mkdir" name="Create Timestamp Folder">
      <path content="c:\Development\%TIMESTAMP%">
        <replacements variable="%TIMESTAMP%">
          <replacer xsi:type="workflow:TimestampReplacer" formatter="yyyy-MM-dd"/>
        </replacements>
      </path>
    </operations>
    <operations xsi:type="workflow:Mkdir" name="Create Folder">
      <path content="c:\Development\%INPUT%">
        <replacements variable="%INPUT%">
          <replacer xsi:type="workflow:InputReplacer" value="Give a name for that folder" title="Input Dialog"/>
        </replacements>
      </path>
    </operations>
    <operations xsi:type="workflow:Mkdir" name="Create Folder by Option">
      <path content="c:\Development\%OPTION%">
        <replacements variable="%OPTION%">
          <replacer xsi:type="workflow:OptionReplacer">
            <options value="Eclipse"/>
            <options value="IntelliJ"/>
            <options value="Netbeans"/>
          </replacer>
        </replacements>
      </path>
    </operations>
    <operations xsi:type="workflow:Exe" name="Notepad++" exeType="File">
      <path content="C:\Program Files\Notepad++\notepad++.exe"/>
    </operations>
  </workflows>
  <workflows content="Formular">
    <dialogs title="InputDialog Example" description="Small example to demonstrate how it works" content="Hello %NAME% %LAST_NAME%, how are you? Your birthday is on %BIRHTDAY%">
      <controls xsi:type="workflow:TextControl" content="Name" variable="%NAME%" value="Peter"/>
      <controls xsi:type="workflow:TextControl" content="Lastname" variable="%LAST_NAME%" value="Jackson"/>
    </dialogs>
  </workflows>
  <workflows content="Input Dialog Demos">
    <operations xsi:type="workflow:ServiceCheck"/>
    <dialogs title="Input Dialog Contact" description="Small dialog to generate contact data" content="Small test using name [%NAME%] and lastname [%LASTNAME%]. Contact birthday[%BIRTHDAY%]. Status equals [%STATUS%]" useTemplate="true" templateName="template-contact.tpl">
      <controls xsi:type="workflow:TextControl" variable="%NAME%" value="Peter"/>
      <controls xsi:type="workflow:TextControl" variable="%LASTNAME%" value="Jackson"/>
      <controls xsi:type="workflow:DateControl" variable="%BIRTHDAY%" value="14-01-2020" formatter="dd-MM-yyyy"/>
      <controls xsi:type="workflow:ComboControl" variable="%STATUS%" value="Info">
        <items value="Warning"/>
        <items value="Info"/>
        <items value="Error"/>
      </controls>
    </dialogs>
    <dialogs title="Query Registration Generator" useTemplate="true" templateName="template-query-registration.tpl">
      <controls xsi:type="workflow:ComboControl" variable="%TABLE_NAME%" value="Registration">
        <items value="Registration"/>
        <items value="Contact"/>
        <items value="Address"/>
      </controls>
      <controls xsi:type="workflow:TextControl" variable="%NAME%" value="Peter Parker"/>
      <controls xsi:type="workflow:TextControl" variable="%ID%"/>
      <controls xsi:type="workflow:ListControl" variable="%OPERATION_SYSTEM%" value="Windows">
        <items value="Windows"/>
        <items value="MacOS"/>
        <items value="Linux"/>
      </controls>
    </dialogs>
  </workflows>
  <workflows content="Clipboard Demos">
    <operations xsi:type="workflow:Clipboard" name="Hello Clipboard" content="Hello Clipboard"/>
    <operations xsi:type="workflow:Clipboard" name="Hello Clipboard with Replacement" content="Hello Clipboard %REPLACEMENT%">
      <replacements variable="%REPLACEMENT%">
        <replacer value="Testing"/>
      </replacements>
    </operations>
    <operations xsi:type="workflow:Clipboard" name="Hello Clipboard with Input Replacement" content="Hello Clipboard %REPLACEMENT%">
      <replacements variable="%REPLACEMENT%">
        <replacer xsi:type="workflow:InputReplacer" title="Input Dialog" message="Please give a message"/>
      </replacements>
    </operations>
  </workflows>
  <workflows content="Database Demos">
    <views xsi:type="workflow:DBTableView" table="Registration">
      <database jdbcDriver="org.h2.Driver" dbUrl="jdbc:h2:file:./data/Repository" query="SELECT * FROM Registration" user="sa" password="sa"/>
      <queries content="SELECT * FROM Registration where id >= '%ID%'" name="Find all registrations greater than equals id input">
        <replacements variable="%ID%">
          <replacer xsi:type="workflow:InputReplacer" value="3" title="Id Input" message="Please give an input to filter"/>
        </replacements>
      </queries>
      <queries content="SELECT * FROM Registration" name="Find all registrations"/>
      <queries content="SELECT * FROM Registration where id >= %ID%" name="Find all registrations greater than equals id 3">
        <replacements variable="%ID%">
          <replacer value="3"/>
        </replacements>
      </queries>
      <queries content="SELECT * FROM Registration where last = '%LAST%' and first = '%FIRST%" name="Find all registration from Peter Parker">
        <replacements variable="%FIRST%">
          <replacer value="Peter"/>
        </replacements>
        <replacements variable="%LAST%">
          <replacer value="Parker"/>
        </replacements>
      </queries>
      <console/>
    </views>
  </workflows>
  <workflows content="Remote Desktiop">
    <operations xsi:type="workflow:RemoteDesktop" name="Test Server" server="DummyServer" user="max" password="maxmustermann"/>
    <operations xsi:type="workflow:RemoteDesktop" name="Production Server" server="ProductionServer" user="max" password="maxmustermann"/>
    <operations xsi:type="workflow:RemoteDesktop" name="Passwort Server" server="PasswordServer" user="max" password=""/>
  </workflows>
  <workflows content="InputDialog Demos">
    <dialogs title="Example" description="Small example to demonstrate how it works" content="Hello %NAME% %LAST_NAME%, how are you? Your birthday is on %BIRHTDAY%">
      <controls xsi:type="workflow:TextControl" content="Name" variable="%NAME%"/>
      <controls xsi:type="workflow:TextControl" content="Lastname" variable="%LAST_NAME%"/>
      <controls xsi:type="workflow:DateControl" content="Birthday" variable="%BIRTHDAY%" value="12-05-2021" formatter="dd.MM.yyyy"/>
    </dialogs>
  </workflows>
  <workflows content="File &amp; Folder Demos">
    <operations xsi:type="workflow:Mkdir" name="Create Timestamp Folder">
      <path content="c:\Development\%TIMESTAMP%">
        <replacements variable="%TIMESTAMP%">
          <replacer xsi:type="workflow:TimestampReplacer" formatter="yyyy-MM-dd"/>
        </replacements>
      </path>
    </operations>
    <operations xsi:type="workflow:Mkdir" name="Create Folder">
      <path content="c:\Development\%INPUT%">
        <replacements variable="%INPUT%">
          <replacer xsi:type="workflow:InputReplacer" value="Example" title="Input Dialog" message="Give a name for that folder"/>
        </replacements>
      </path>
    </operations>
    <operations xsi:type="workflow:Mkdir" name="Create Folder by Option">
      <path content="c:\Development\%OPTION%">
        <replacements variable="%OPTION%">
          <replacer xsi:type="workflow:OptionReplacer" value="">
            <options name="Eclipe"/>
            <options name="Notepad++"/>
            <options name="Netbeans"/>
          </replacer>
        </replacements>
      </path>
    </operations>
  </workflows>
  <workflows content="Copy Demo">
    <operations xsi:type="workflow:Copy" name="File">
      <source content="C:\Users\Desktop\0020.DCM"/>
      <destination content="C:\Development\test.dcm"/>
    </operations>
    <operations xsi:type="workflow:Copy" name="File with timestamp">
      <source content="C:\Users\Desktop\0020.DCM"/>
      <destination content="C:\Development\%DATE%.dcm">
        <replacements variable="%DATE%">
          <replacer xsi:type="workflow:TimestampReplacer" formatter="yyyyMMdd-hhmmss"/>
        </replacements>
      </destination>
    </operations>
    <operations xsi:type="workflow:Zip" name="File">
      <source content="C:\Taumi\Taumi-Logo.png"/>
      <destination content="C:\Development\%DATETIME%_test.zip">
        <replacements variable="%DATETIME%">
          <replacer xsi:type="workflow:TimestampReplacer" formatter="yyyyMMddhhmmss"/>
        </replacements>
      </destination>
    </operations>
  </workflows>
  <workflows content="Chart Demos">
    <views xsi:type="workflow:LineChart" title="Income Per Month" xTitle="Month" yTitle="Income">
      <points x="1.0" y="20.0"/>
      <points x="2.0" y="39.0"/>
      <points x="4.0" y="55.0"/>
      <points x="1.0" y="1.0"/>
      <points x="2.0" y="2.0"/>
      <points x="3.0" y="3.0"/>
      <points x="4.0" y="4.0"/>
      <points x="5.0" y="5.0"/>
      <points x="6.0" y="6.0"/>
      <points x="7.0" y="7.0"/>
      <points x="8.0" y="8.0"/>
      <points x="9.0" y="9.0"/>
      <points x="10.0" y="10.0"/>
      <points x="1.0" y="1.0"/>
      <points x="2.0" y="2.0"/>
      <points x="3.0" y="3.0"/>
      <points x="4.0" y="4.0"/>
      <points x="5.0" y="5.0"/>
      <points x="6.0" y="6.0"/>
      <points x="7.0" y="7.0"/>
      <points x="8.0" y="8.0"/>
      <points x="9.0" y="9.0"/>
      <points x="10.0" y="10.0"/>
    </views>
    <views xsi:type="workflow:CsvTableParser" filePath="C:\Users\Desktop\data.csv"/>
  </workflows>
</workflow:WorkflowManager>
