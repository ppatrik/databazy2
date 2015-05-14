USE tempdb 
GO  

-- Úloha è. 7
DROP TABLE hahaTab 
DROP XML SCHEMA COLLECTION hahaSch 
GO  
CREATE XML SCHEMA COLLECTION hahaSch AS ('<?xml version="1.0" encoding="utf-8"?>
<xs:schema 
	attributeFormDefault="unqualified" 
	elementFormDefault="qualified" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:simpleType name="dni">
    	<xs:restriction base="xs:string">
    		<xs:enumeration value="Pondelok"/>
    		<xs:enumeration value="Streda"/>
    		<xs:enumeration value="Piatok"/>
    		<xs:enumeration value="Sobota"/>
    	</xs:restriction>
    </xs:simpleType>
    <xs:simpleType name="cisla">
    	<xs:restriction base="xs:nonNegativeInteger">
    		<xs:minInclusive value="1"></xs:minInclusive>
			<xs:maxInclusive value="31"></xs:maxInclusive>
    	</xs:restriction>
    </xs:simpleType>
    <xs:element name="Matrix">
    	<xs:complexType>
    		<xs:sequence>
    			<xs:element maxOccurs="unbounded" name="row">
	    			<xs:complexType>
	    				<xs:attribute name="Col1" type="cisla" use="required" />
	    				<xs:attribute name="Col2" type="dni" use="required" />
	    			</xs:complexType>
	    		</xs:element>
	    	</xs:sequence>
	    </xs:complexType>
	</xs:element>
</xs:schema>') ; 
GO  
SELECT * FROM sys.xml_schema_collections 

CREATE TABLE hahaTab (
		 x xml (hahaSch)
) 
GO  
INSERT INTO hahaTab VALUES('<Matrix>
   <row Col1="1" Col2="Pondelok" />
   <row Col1="31" Col2="Streda" />
</Matrix>');

INSERT INTO hahaTab VALUES('<Matrix>
   <row Col1="4" Col2="Sobota" />
   <row Col1="31" Col2="Pondelok" />
</Matrix>');

SELECT * FROM hahaTab