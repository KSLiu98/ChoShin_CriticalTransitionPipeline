<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.44 (Build 295) (http://www.copasi.org) at 2024-07-23T19:56:17Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="44" versionDevel="295" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_13" name="Mass action (irreversible)" type="MassAction" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_13">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000163" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for irreversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i>
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_80" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_81" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Cho_Shin_Creation_HillFunction_OneSpecies" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_41">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (G/FC)*(FC+((1-FC)/(1+(y/TH)^N)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_275" name="G" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_274" name="FC" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_273" name="y" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_272" name="TH" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_266" name="N" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Cho_Shin_Creation_HillFunction_ThreeSpecies" type="UserDefined" reversible="unspecified">
      <Expression>
        (G/FC1)*(FC1+((1-FC1)/(1+(y1/TH1)^N1)))*(1/FC2)*(FC2+((1-FC2)/(1+(y2/TH2)^N2)))*(1/FC3)*(FC3+((1-FC3)/(1+(y3/TH3)^N3)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_280" name="G" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_279" name="FC1" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_278" name="y1" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_277" name="TH1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_276" name="N1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_281" name="FC2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_282" name="y2" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_283" name="TH2" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_284" name="N2" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_285" name="FC3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="y3" order="10" role="modifier"/>
        <ParameterDescription key="FunctionParameter_287" name="TH3" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_288" name="N3" order="12" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Cho_Shin_Creation_HillFunction_ThreeSpecies_MissingFC1" type="UserDefined" reversible="unspecified">
      <Expression>
        G*(FC1+((1-FC1)/(1+(y1/TH1)^N1)))*(1/FC2)*(FC2+((1-FC2)/(1+(y2/TH2)^N2)))*(1/FC3)*(FC3+((1-FC3)/(1+(y3/TH3)^N3)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_379" name="G" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_383" name="FC1" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_391" name="y1" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_399" name="TH1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_388" name="N1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_371" name="FC2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_362" name="y2" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_375" name="TH2" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_400" name="N2" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_405" name="FC3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_407" name="y3" order="10" role="modifier"/>
        <ParameterDescription key="FunctionParameter_409" name="TH3" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_411" name="N3" order="12" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_1" name="Cho_Shin_LungCancer_GRN" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mol" type="deterministic" avogadroConstant="6.0221407599999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2024-07-16T17:42:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="compartment" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="Y1" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="Y2" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="Y3" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="Y4" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_4" name="Y5" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="Y6" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="Y7" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="Y8" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="Y1 destruction" reversible="false" fast="false" addNoise="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4675" name="k1" value="4.0293"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_4675"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="Y1 creation" reversible="false" fast="false" addNoise="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4670" name="G" value="36.437"/>
          <Constant key="Parameter_4674" name="FC" value="50.764"/>
          <Constant key="Parameter_4673" name="TH" value="3.7388"/>
          <Constant key="Parameter_6919" name="N" value="2"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_4670"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Parameter_4674"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_4673"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_6919"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="Y2 destruction" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_6920" name="k1" value="0.73339"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_6920"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="Y2 creation" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_0" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_2" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6923" name="G" value="94.764"/>
          <Constant key="Parameter_6918" name="FC1" value="48.834"/>
          <Constant key="Parameter_6922" name="TH1" value="29.777"/>
          <Constant key="Parameter_6921" name="N1" value="5"/>
          <Constant key="Parameter_4643" name="FC2" value="92.651"/>
          <Constant key="Parameter_4644" name="TH2" value="6.0194"/>
          <Constant key="Parameter_4650" name="N2" value="3"/>
          <Constant key="Parameter_4642" name="FC3" value="36.102"/>
          <Constant key="Parameter_4649" name="TH3" value="67.22"/>
          <Constant key="Parameter_4647" name="N3" value="4"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Parameter_6923"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Parameter_6918"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Parameter_6922"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_6921"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="Parameter_4643"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Parameter_4644"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Parameter_4650"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Parameter_4642"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Parameter_4649"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Parameter_4647"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="Y3 destruction" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4646" name="k1" value="0.63639"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_4646"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="Y3 creation" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4648" name="G" value="58.436"/>
          <Constant key="Parameter_4645" name="FC" value="38.165"/>
          <Constant key="Parameter_7503" name="TH" value="2.5773"/>
          <Constant key="Parameter_7504" name="N" value="5"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_4648"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Parameter_4645"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_7503"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_7504"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="Y4 destruction" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_7507" name="k1" value="0.01638"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_7507"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="Y4 creation" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_7502" name="G" value="73.576"/>
          <Constant key="Parameter_7506" name="FC" value="11.695"/>
          <Constant key="Parameter_7505" name="TH" value="9.6368"/>
          <Constant key="Parameter_6022" name="N" value="2"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_7502"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Parameter_7506"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_7505"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_6022"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="Y5 destruction" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_6023" name="k1" value="0.32857"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_6023"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="Y5 creation" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6025" name="G" value="52.016"/>
          <Constant key="Parameter_6021" name="FC" value="76.83"/>
          <Constant key="Parameter_6024" name="TH" value="4.79"/>
          <Constant key="Parameter_6506" name="N" value="5"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_6025"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Parameter_6021"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_6024"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_6506"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="Y6 destruction" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_6507" name="k1" value="0.32384"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_6507"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="Y6 creation" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6509" name="G" value="31.963"/>
          <Constant key="Parameter_6505" name="FC" value="58.55"/>
          <Constant key="Parameter_6508" name="TH" value="78.959"/>
          <Constant key="Parameter_7341" name="N" value="2"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_6509"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Parameter_6505"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_6508"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_7341"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="Y7 destruction" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_12">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_7342" name="k1" value="0.35657"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_7342"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="Y7 creation" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_7344" name="G" value="7.6353"/>
          <Constant key="Parameter_7340" name="FC" value="78.563"/>
          <Constant key="Parameter_7343" name="TH" value="43.133"/>
          <Constant key="Parameter_4922" name="N" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_7344"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Parameter_7340"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_7343"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_4922"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="Y8 destruction" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4923" name="k1" value="0.53837"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_4923"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="Y8 creation" reversible="false" fast="false" addNoise="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_0" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4925" name="G" value="39.92"/>
          <Constant key="Parameter_4921" name="FC1" value="85.693"/>
          <Constant key="Parameter_4924" name="TH1" value="4.0907"/>
          <Constant key="Parameter_6773" name="N1" value="4"/>
          <Constant key="Parameter_6774" name="FC2" value="93.561"/>
          <Constant key="Parameter_6776" name="TH2" value="8.1658"/>
          <Constant key="Parameter_6772" name="N2" value="2"/>
          <Constant key="Parameter_6775" name="FC3" value="92.464"/>
          <Constant key="Parameter_8028" name="TH3" value="59.781"/>
          <Constant key="Parameter_8029" name="N3" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="Parameter_4925"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="Parameter_4921"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="Parameter_4924"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Parameter_6773"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_371">
              <SourceParameter reference="Parameter_6774"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="Parameter_6776"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="Parameter_6772"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Parameter_6775"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Parameter_8028"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_411">
              <SourceParameter reference="Parameter_8029"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_1">
      <ModelParameterSet key="ModelParameterSet_1" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y1]" value="6.0221407599999623e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y2]" value="6.0221407599999656e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y3]" value="6.0221407599999703e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y4]" value="6.022140759999973e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y5]" value="6.0221407599999757e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y6]" value="6.0221407599999791e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y7]" value="6.0221407599999818e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y8]" value="6.0221407599999851e+23" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 destruction],ParameterGroup=Parameters,Parameter=k1" value="4.0293000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=G" value="36.436999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=FC" value="50.764000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=TH" value="3.7387999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=N" value="2" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 destruction],ParameterGroup=Parameters,Parameter=k1" value="0.73338999999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=G" value="94.763999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=FC1" value="48.834000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=TH1" value="29.777000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=N1" value="5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=FC2" value="92.650999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=TH2" value="6.0194000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=N2" value="3" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=FC3" value="36.101999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=TH3" value="67.219999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=N3" value="4" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 destruction],ParameterGroup=Parameters,Parameter=k1" value="0.63639000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=G" value="58.436" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=FC" value="38.164999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=TH" value="2.5773000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=N" value="5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 destruction],ParameterGroup=Parameters,Parameter=k1" value="0.016379999999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=G" value="73.575999999999993" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=FC" value="11.695" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=TH" value="9.6367999999999991" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=N" value="2" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 destruction],ParameterGroup=Parameters,Parameter=k1" value="0.32856999999999997" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=G" value="52.015999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=FC" value="76.829999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=TH" value="4.79" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=N" value="5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 destruction],ParameterGroup=Parameters,Parameter=k1" value="0.32384000000000002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=G" value="31.963000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=FC" value="58.549999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=TH" value="78.959000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=N" value="2" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 destruction],ParameterGroup=Parameters,Parameter=k1" value="0.35657" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=G" value="7.6353" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=FC" value="78.563000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=TH" value="43.133000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=N" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 destruction]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 destruction],ParameterGroup=Parameters,Parameter=k1" value="0.53837000000000002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=G" value="39.920000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=FC1" value="85.692999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=TH1" value="4.0907" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=N1" value="4" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=FC2" value="93.561000000000007" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=TH2" value="8.1658000000000008" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=N2" value="2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=FC3" value="92.463999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=TH3" value="59.780999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=N3" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_1"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 6.0221407599999623e+23 6.0221407599999656e+23 6.0221407599999703e+23 6.022140759999973e+23 6.0221407599999757e+23 6.0221407599999791e+23 6.0221407599999818e+23 6.0221407599999851e+23 1 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_17" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_11" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="0"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_18" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_12" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_19" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Report reference="Report_22" target="Cho_Shin_LungCancer_GRN_8.txt" append="0" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="0"/>
        <ParameterGroup name="ScanItems">
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5000"/>
            <Parameter name="Type" type="unsignedInteger" value="0"/>
            <Parameter name="Object" type="cn" value=""/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y1],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y2],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y3],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y4],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y5],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y6],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y7],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="5"/>
            <Parameter name="Type" type="unsignedInteger" value="2"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y8],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1e-08"/>
            <Parameter name="Maximum" type="float" value="1000000"/>
            <Parameter name="log" type="bool" value="1"/>
            <Parameter name="Distribution type" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
        <Parameter name="Subtask Output" type="string" value="none"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_20" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_13" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_21" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_14" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_22" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_15" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_23" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_16" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_17"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_24" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_17" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_25" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_18" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_26" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_19" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_27" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_20" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_28" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_29" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_21" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_17"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_30" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_11" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_12" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_13" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_14" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_15" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_16" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_17" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_18" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_19" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_20" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_21" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_22" name="Scan Parameters, Time, Concentrations, Volumes, and Global Quantity Values" taskType="scan" separator="&#x09;" precision="6">
      <Comment>
        A table of scan parameters, time, variable species concentrations, variable compartment volumes, and variable global quantity values.
      </Comment>
      <Table printTitle="1">
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=FC,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=N,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 creation],ParameterGroup=Parameters,Parameter=TH,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y1 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=FC1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=FC2,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=FC3,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=N1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=N2,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=N3,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=TH1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=TH2,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 creation],ParameterGroup=Parameters,Parameter=TH3,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y2 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=FC,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=N,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 creation],ParameterGroup=Parameters,Parameter=TH,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y3 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=FC,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=N,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 creation],ParameterGroup=Parameters,Parameter=TH,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y4 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=FC,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=N,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 creation],ParameterGroup=Parameters,Parameter=TH,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y5 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=FC,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=N,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 creation],ParameterGroup=Parameters,Parameter=TH,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y6 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=FC,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=N,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 creation],ParameterGroup=Parameters,Parameter=TH,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y7 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=FC1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=FC2,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=FC3,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=G,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=N1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=N2,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=N3,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=TH1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=TH2,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 creation],ParameterGroup=Parameters,Parameter=TH3,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Reactions[Y8 destruction],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y1],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y2],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y3],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y4],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y5],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y6],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y7],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y8],Reference=InitialConcentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Reference=Time"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y1],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y2],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y3],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y4],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y5],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y6],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y7],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Cho_Shin_LungCancer_GRN,Vector=Compartments[compartment],Vector=Metabolites[Y8],Reference=Concentration"/>
      </Table>
    </Report>
  </ListOfReports>
  <GUI>
  </GUI>
  <ListOfLayouts xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <Layout key="Layout_2" name="COPASI autolayout">
      <Dimensions width="93.346770857308712" height="86.684643559782913"/>
      <ListOfMetabGlyphs>
        <MetaboliteGlyph key="Layout_3" name="MetabGlyph" metabolite="Metabolite_0">
          <BoundingBox>
            <Position x="551.99004442214482" y="329.94225476685892"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_4" name="MetabGlyph" metabolite="Metabolite_1">
          <BoundingBox>
            <Position x="437.06148880358137" y="321.67948810708003"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_5" name="MetabGlyph" metabolite="Metabolite_7">
          <BoundingBox>
            <Position x="510.27689191817012" y="364.30499714053235"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_6" name="MetabGlyph" metabolite="Metabolite_4">
          <BoundingBox>
            <Position x="169.95293033258486" y="203.2602105802589"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_7" name="MetabGlyph" metabolite="Metabolite_6">
          <BoundingBox>
            <Position x="294.28912299558442" y="486.38216595903737"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_8" name="MetabGlyph" metabolite="Metabolite_2">
          <BoundingBox>
            <Position x="255.71922891944405" y="255.28030341558701"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_9" name="MetabGlyph" metabolite="Metabolite_3">
          <BoundingBox>
            <Position x="447.87636164753962" y="127.93525672511555"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_10" name="MetabGlyph" metabolite="Metabolite_5">
          <BoundingBox>
            <Position x="104.14149445996873" y="447.90347601403369"/>
            <Dimensions width="36" height="28"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_11" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="217.96204435832874" y="409.31480650847175"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_12" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="730.28351806080377" y="396.42635653443745"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_13" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="660.34923006469489" y="222.84130610888292"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_14" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="416.25679250210806" y="223.52832704965817"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_15" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="546.41290740959084" y="202.59210527754271"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_16" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="189.23199837111338" y="49.195672496468205"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_17" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="590.48010548986258" y="538.84623937157016"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_18" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="453.00410194359392" y="502.41180885768426"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_19" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="41.518267871548915" y="184.16064938023237"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_20" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="381.73613084340764" y="648.78142975095579"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_21" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="537.44733454122479" y="0"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_22" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="113.92053335265314" y="305.66574084004401"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_23" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="317.40325092309672" y="189.44692578044987"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_24" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="195.61833894418783" y="601.46100139349346"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_25" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="316.25333116430079" y="395.98806359517744"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_26" name="MetabGlyph" objectRole="invisible">
          <BoundingBox>
            <Position x="0" y="557.90129625521763"/>
            <Dimensions width="1" height="1"/>
          </BoundingBox>
        </MetaboliteGlyph>
      </ListOfMetabGlyphs>
      <ListOfReactionGlyphs>
        <ReactionGlyph key="Layout_27" name="ReactionGlyph" reaction="Reaction_11">
          <BoundingBox>
            <Position x="148.33114025829536" y="375.88811430261012"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="153.14716775321335" y="373.28368082733203"/>
                <End x="143.51511276337737" y="378.49254777788821"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_28" name="MetabReferenceGlyph" metaboliteGlyph="Layout_11" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="153.14716775321335" y="373.28368082733203"/>
                    <End x="212.96204435832874" y="405.69199173697075"/>
                    <BasePoint1 x="162.77922274304936" y="368.07481387677581"/>
                    <BasePoint2 x="190.27864729814803" y="385.58118606923426"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_29" name="MetabReferenceGlyph" metaboliteGlyph="Layout_10" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="143.51511276337737" y="378.49254777788821"/>
                    <End x="124.99422876505525" y="442.90347601403369"/>
                    <BasePoint1 x="133.88305777354137" y="383.70141472844443"/>
                    <BasePoint2 x="127.03062952183933" y="414.60466210887807"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_30" name="MetabReferenceGlyph" metaboliteGlyph="Layout_6" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="182.32532546220861" y="236.2602105802589"/>
                    <End x="143.574308674082" y="367.09194733742407"/>
                    <BasePoint1 x="162.94981706814531" y="301.67607895884146"/>
                    <BasePoint2 x="138.81747708986865" y="358.29578037223803"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_31" name="ReactionGlyph" reaction="Reaction_0">
          <BoundingBox>
            <Position x="654.23532087387343" y="371.96338843098238"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="646.19564719194045" y="369.31418334260343"/>
                <End x="662.27499455580642" y="374.61259351936133"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_32" name="MetabReferenceGlyph" metaboliteGlyph="Layout_3" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="646.19564719194045" y="369.31418334260343"/>
                    <End x="592.99004442214482" y="351.6209455494411"/>
                    <BasePoint1 x="630.1162998280746" y="364.01577316584559"/>
                    <BasePoint2 x="607.53333528414328" y="356.49375681345384"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_33" name="MetabReferenceGlyph" metaboliteGlyph="Layout_12" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="662.27499455580642" y="374.61259351936133"/>
                    <End x="725.28351806080377" y="395.14138779186487"/>
                    <BasePoint1 x="678.35434191967227" y="379.91100369611917"/>
                    <BasePoint2 x="705.83876683120445" y="388.85079828818147"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_34" name="ReactionGlyph" reaction="Reaction_1">
          <BoundingBox>
            <Position x="592.45865478861515" y="272.69653536287137"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="597.00161407074268" y="266.66648792997256"/>
                <End x="587.91569550648762" y="278.72658279577018"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_35" name="MetabReferenceGlyph" metaboliteGlyph="Layout_13" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="597.00161407074268" y="266.66648792997256"/>
                    <End x="655.34923006469489" y="226.48142020916012"/>
                    <BasePoint1 x="606.08753263499761" y="254.60639306417497"/>
                    <BasePoint2 x="632.98986099091007" y="237.52888292021814"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_36" name="MetabReferenceGlyph" metaboliteGlyph="Layout_3" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="587.91569550648762" y="278.72658279577018"/>
                    <End x="573.14973014146233" y="324.94225476685892"/>
                    <BasePoint1 x="578.82977694223268" y="290.78667766156775"/>
                    <BasePoint2 x="573.71827390078374" y="310.87948993066277"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_37" name="MetabReferenceGlyph" metaboliteGlyph="Layout_4" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="478.06148880358137" y="323.41611036633913"/>
                    <End x="584.4716584218462" y="266.67923621481333"/>
                    <BasePoint1 x="531.26657361271373" y="295.0476732905762"/>
                    <BasePoint2 x="576.48466205507725" y="260.66193706675529"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_38" name="ReactionGlyph" reaction="Reaction_7">
          <BoundingBox>
            <Position x="379.75044710034558" y="159.77451175925626"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="377.29446864307403" y="163.87916527548339"/>
                <End x="382.20642555761714" y="155.66985824302913"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_39" name="MetabReferenceGlyph" metaboliteGlyph="Layout_14" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="377.29446864307403" y="163.87916527548339"/>
                    <End x="412.05792406151852" y="218.52832704965817"/>
                    <BasePoint1 x="372.38251172853086" y="172.08847230793765"/>
                    <BasePoint2 x="390.99222866638888" y="197.36072643691148"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_40" name="MetabReferenceGlyph" metaboliteGlyph="Layout_9" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="382.20642555761714" y="155.66985824302913"/>
                    <End x="442.87636164753962" y="143.54883003535218"/>
                    <BasePoint1 x="387.11838247216031" y="147.46055121057486"/>
                    <BasePoint2 x="416.22536128848577" y="143.45236386484996"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_41" name="MetabReferenceGlyph" metaboliteGlyph="Layout_8" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="289.87018691499901" y="250.28030341558701"/>
                    <End x="371.16923983443161" y="154.64003205246755"/>
                    <BasePoint1 x="330.51971337471531" y="202.46016773402727"/>
                    <BasePoint2 x="362.58803256851763" y="149.50555234567884"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_42" name="ReactionGlyph" reaction="Reaction_15">
          <BoundingBox>
            <Position x="512.07537850299377" y="277.44914389535938"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="513.00717927756477" y="268.68849930220989"/>
                <End x="511.14357772842277" y="286.20978848850888"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_43" name="MetabReferenceGlyph" metaboliteGlyph="Layout_15" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="513.00717927756477" y="268.68849930220989"/>
                    <End x="543.24714949188342" y="208.59210527754271"/>
                    <BasePoint1 x="514.87078082670689" y="251.16721011591093"/>
                    <BasePoint2 x="529.52486554658071" y="225.49933540015209"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_44" name="MetabReferenceGlyph" metaboliteGlyph="Layout_5" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="511.14357772842277" y="286.20978848850888"/>
                    <End x="523.43684325739412" y="359.30499714053235"/>
                    <BasePoint1 x="509.27997617928065" y="303.73107767480781"/>
                    <BasePoint2 x="515.89250933105188" y="335.89835970424485"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_45" name="MetabReferenceGlyph" metaboliteGlyph="Layout_3" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="556.0611378479025" y="324.94225476685892"/>
                    <End x="522.01928944626627" y="278.50679939327244"/>
                    <BasePoint1 x="539.04021364708433" y="301.72452708006568"/>
                    <BasePoint2 x="531.96320038953877" y="279.56445489118545"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_46" name="MetabReferenceGlyph" metaboliteGlyph="Layout_4" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="470.14598483560621" y="316.67948810708003"/>
                    <End x="502.13146755972127" y="276.39148839744632"/>
                    <BasePoint1 x="486.13872619766374" y="296.53548825226318"/>
                    <BasePoint2 x="492.18755661644877" y="275.33383289953332"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_47" name="MetabReferenceGlyph" metaboliteGlyph="Layout_9" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="470.99956794124398" y="160.93525672511555"/>
                    <End x="502.13146755972127" y="276.39148839744632"/>
                    <BasePoint1 x="486.56551775048263" y="218.66337256128094"/>
                    <BasePoint2 x="492.18755661644877" y="275.33383289953332"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_48" name="ReactionGlyph" reaction="Reaction_8">
          <BoundingBox>
            <Position x="190.1272729308098" y="129.35371523906952"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="190.03831952888336" y="137.73194214325906"/>
                <End x="190.21622633273623" y="120.97548833487997"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_49" name="MetabReferenceGlyph" metaboliteGlyph="Layout_6" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="190.03831952888336" y="137.73194214325906"/>
                    <End x="188.53029400561053" y="198.2602105802589"/>
                    <BasePoint1 x="189.8604127250305" y="154.48839595163813"/>
                    <BasePoint2 x="189.15087666435733" y="180.5634167180433"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_50" name="MetabReferenceGlyph" metaboliteGlyph="Layout_16" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="190.21622633273623" y="120.97548833487997"/>
                    <End x="189.79879067948406" y="55.195672496468205"/>
                    <BasePoint1 x="190.39413313658909" y="104.21903452650091"/>
                    <BasePoint2 x="190.14093860899976" y="75.518240059389768"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_51" name="ReactionGlyph" reaction="Reaction_14">
          <BoundingBox>
            <Position x="563.78053671800399" y="462.79958202243574"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="560.64537603941938" y="454.74751991088385"/>
                <End x="566.9156973965886" y="470.85164413398763"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_52" name="MetabReferenceGlyph" metaboliteGlyph="Layout_5" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="560.64537603941938" y="454.74751991088385"/>
                    <End x="536.49496041942871" y="397.30499714053235"/>
                    <BasePoint1 x="554.37505468225015" y="438.64339568778007"/>
                    <BasePoint2 x="543.86742721154701" y="413.94816535838027"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_53" name="MetabReferenceGlyph" metaboliteGlyph="Layout_17" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="566.9156973965886" y="470.85164413398763"/>
                    <End x="589.11206584155457" y="533.84623937157016"/>
                    <BasePoint1 x="573.18601875375782" y="486.95576835709142"/>
                    <BasePoint2 x="582.71662263694861" y="514.42703492010673"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_54" name="ReactionGlyph" reaction="Reaction_2">
          <BoundingBox>
            <Position x="449.13018464736751" y="422.95492676855679"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="449.20805399036692" y="414.59331073102658"/>
                <End x="449.05231530436811" y="431.316542806087"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_55" name="MetabReferenceGlyph" metaboliteGlyph="Layout_4" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="449.20805399036692" y="414.59331073102658"/>
                    <End x="453.32077167159014" y="354.67948810708003"/>
                    <BasePoint1 x="449.36379267636562" y="397.87007865596615"/>
                    <BasePoint2 x="451.38121684547752" y="372.09397536275799"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_56" name="MetabReferenceGlyph" metaboliteGlyph="Layout_18" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="449.05231530436811" y="431.316542806087"/>
                    <End x="453.04227489888166" y="497.41180885768426"/>
                    <BasePoint1 x="448.89657661836941" y="448.03977488114742"/>
                    <BasePoint2 x="450.9304910871258" y="476.90659988818095"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_57" name="ReactionGlyph" reaction="Reaction_9">
          <BoundingBox>
            <Position x="119.58816311643" y="215.32479882710368"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="112.29142999337819" y="213.69482076710236"/>
                <End x="126.8848962394818" y="216.954776887105"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_58" name="MetabReferenceGlyph" metaboliteGlyph="Layout_19" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="112.29142999337819" y="213.69482076710236"/>
                    <End x="47.518267871548915" y="187.20660768223473"/>
                    <BasePoint1 x="97.697963747274599" y="210.43486464709969"/>
                    <BasePoint2 x="68.959749247885838" y="198.00574713466656"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_59" name="MetabReferenceGlyph" metaboliteGlyph="Layout_6" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="126.8848962394818" y="216.954776887105"/>
                    <End x="164.95293033258486" y="218.72238696974648"/>
                    <BasePoint1 x="141.47836248558539" y="220.21473300710767"/>
                    <BasePoint2 x="156.86401297061104" y="220.28354901842772"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_60" name="MetabReferenceGlyph" metaboliteGlyph="Layout_8" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="250.71922891944405" y="262.7771922770188"/>
                    <End x="117.40804921165611" y="225.08426107469762"/>
                    <BasePoint1 x="184.06363906555009" y="243.93072667585821"/>
                    <BasePoint2 x="115.22793530688222" y="234.84372332229157"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_61" name="ReactionGlyph" reaction="Reaction_12">
          <BoundingBox>
            <Position x="345.53127626902028" y="578.22184215723041"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="342.0339258766291" y="570.7768789676345"/>
                <End x="349.02862666141147" y="585.66680534682632"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_62" name="MetabReferenceGlyph" metaboliteGlyph="Layout_7" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="342.0339258766291" y="570.7768789676345"/>
                    <End x="320.07677458525808" y="519.38216595903737"/>
                    <BasePoint1 x="335.03922509184679" y="555.88695258844268"/>
                    <BasePoint2 x="325.80932464235684" y="533.91207767894207"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_63" name="MetabReferenceGlyph" metaboliteGlyph="Layout_20" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="349.02862666141147" y="585.66680534682632"/>
                    <End x="379.27725322017665" y="643.78142975095579"/>
                    <BasePoint1 x="356.02332744619378" y="600.55673172601814"/>
                    <BasePoint2 x="369.3989655293808" y="625.89156233328492"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_64" name="ReactionGlyph" reaction="Reaction_6">
          <BoundingBox>
            <Position x="491.10694064672725" y="63.211492433353214"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="487.50339200204303" y="70.283255269608986"/>
                <End x="494.71048929141148" y="56.139729597097443"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_65" name="MetabReferenceGlyph" metaboliteGlyph="Layout_9" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="487.50339200204303" y="70.283255269608986"/>
                    <End x="470.64050683670109" y="122.93525672511555"/>
                    <BasePoint1 x="480.29629471267447" y="84.42678094212053"/>
                    <BasePoint2 x="473.66662645234567" y="107.21690025174593"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_66" name="MetabReferenceGlyph" metaboliteGlyph="Layout_21" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="494.71048929141148" y="56.139729597097443"/>
                    <End x="533.17187088333014" y="6"/>
                    <BasePoint1 x="501.91758658078004" y="41.99620392458587"/>
                    <BasePoint2 x="519.3465030543972" y="20.462220544165064"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_67" name="ReactionGlyph" reaction="Reaction_4">
          <BoundingBox>
            <Position x="198.36052159702672" y="301.66420789465087"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="206.32545637536626" y="299.819936023428"/>
                <End x="190.39558681868718" y="303.50847976587374"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_68" name="MetabReferenceGlyph" metaboliteGlyph="Layout_8" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="206.32545637536626" y="299.819936023428"/>
                    <End x="250.71922891944405" y="281.28046290709136"/>
                    <BasePoint1 x="222.25532593204537" y="296.13139228098231"/>
                    <BasePoint2 x="240.46974481491446" y="287.7837916584254"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_69" name="MetabReferenceGlyph" metaboliteGlyph="Layout_22" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="190.39558681868718" y="303.50847976587374"/>
                    <End x="119.92053335265314" y="306.260203947761"/>
                    <BasePoint1 x="174.4657172620081" y="307.19702350831943"/>
                    <BasePoint2 x="143.21065791816085" y="307.65074966365165"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_70" name="ReactionGlyph" reaction="Reaction_5">
          <BoundingBox>
            <Position x="351.60193941595298" y="268.07881517534611"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="353.81114051613559" y="264.11214629358926"/>
                <End x="349.39273831577037" y="272.04548405710295"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_71" name="MetabReferenceGlyph" metaboliteGlyph="Layout_23" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="353.81114051613559" y="264.11214629358926"/>
                    <End x="321.25200979353627" y="195.44692578044987"/>
                    <BasePoint1 x="358.22954271650087" y="256.17880853007551"/>
                    <BasePoint2 x="340.84537680510994" y="223.82953271438427"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_72" name="MetabReferenceGlyph" metaboliteGlyph="Layout_8" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="349.39273831577037" y="272.04548405710295"/>
                    <End x="296.71922891944405" y="272.73361270103891"/>
                    <BasePoint1 x="344.97433611540509" y="279.9788218206167"/>
                    <BasePoint2 x="319.74218196733324" y="278.33955170170623"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_73" name="MetabReferenceGlyph" metaboliteGlyph="Layout_4" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="432.06148880358137" y="320.44661881350498"/>
                    <End x="360.33836833203264" y="272.94449188000772"/>
                    <BasePoint1 x="396.19992856780698" y="296.69555534675635"/>
                    <BasePoint2 x="369.0747972481123" y="277.81016858466938"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_74" name="ReactionGlyph" reaction="Reaction_13">
          <BoundingBox>
            <Position x="225.43246951249671" y="525.18484992505114"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="219.62393030992689" y="530.26379169677398"/>
                <End x="231.24100871506653" y="520.1059081533283"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_75" name="MetabReferenceGlyph" metaboliteGlyph="Layout_24" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="219.62393030992689" y="530.26379169677398"/>
                    <End x="197.18085986163237" y="596.46100139349346"/>
                    <BasePoint1 x="208.0068519047872" y="540.42167524021954"/>
                    <BasePoint2 x="199.68958628192487" y="570.98080920271786"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_76" name="MetabReferenceGlyph" metaboliteGlyph="Layout_7" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="231.24100871506653" y="520.1059081533283"/>
                    <End x="289.28912299558442" y="503.55099019153693"/>
                    <BasePoint1 x="242.85808712020622" y="509.94802460988274"/>
                    <BasePoint2 x="268.9778746591802" y="504.21003651484841"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_77" name="MetabReferenceGlyph" metaboliteGlyph="Layout_10" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="145.14149445996873" y="475.16318484120649"/>
                    <End x="218.85001498648052" y="517.6568161569993"/>
                    <BasePoint1 x="181.99575472322462" y="496.41000049910292"/>
                    <BasePoint2 x="212.2675604604643" y="510.12878238894746"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_78" name="ReactionGlyph" reaction="Reaction_3">
          <BoundingBox>
            <Position x="385.73442223851771" y="370.01387333310618"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="378.81901435655368" y="373.05430210751103"/>
                <End x="392.64983012048174" y="366.97344455870132"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_79" name="MetabReferenceGlyph" metaboliteGlyph="Layout_25" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="378.81901435655368" y="373.05430210751103"/>
                    <End x="322.25333116430079" y="394.50939180126124"/>
                    <BasePoint1 x="364.98819859262562" y="379.13515965632081"/>
                    <BasePoint2 x="340.16306093748119" y="388.34249011599348"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_80" name="MetabReferenceGlyph" metaboliteGlyph="Layout_4" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="392.64983012048174" y="366.97344455870132"/>
                    <End x="432.06148880358137" y="347.61631834548285"/>
                    <BasePoint1 x="406.4806458844098" y="360.89258700989154"/>
                    <BasePoint2 x="422.7287712849776" y="352.73423829048477"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_81" name="MetabReferenceGlyph" metaboliteGlyph="Layout_3" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="546.99004442214482" y="348.43757889946505"/>
                    <End x="389.7592011974433" y="379.1681703750308"/>
                    <BasePoint1 x="468.37462280979406" y="363.8028746372479"/>
                    <BasePoint2 x="393.7839801563689" y="388.32246741695542"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_82" name="MetabReferenceGlyph" metaboliteGlyph="Layout_8" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="296.1240570908808" y="288.28030341558701"/>
                    <End x="381.70964327959211" y="360.85957629118155"/>
                    <BasePoint1 x="338.91685018523646" y="324.56993985338431"/>
                    <BasePoint2 x="377.68486432066652" y="351.70527924925693"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_83" name="MetabReferenceGlyph" metaboliteGlyph="Layout_7" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="324.4323699757997" y="481.38216595903737"/>
                    <End x="389.7592011974433" y="379.1681703750308"/>
                    <BasePoint1 x="357.0957855866215" y="430.27516816703405"/>
                    <BasePoint2 x="393.7839801563689" y="388.32246741695542"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_84" name="ReactionGlyph" reaction="Reaction_10">
          <BoundingBox>
            <Position x="45.177536849041189" y="493.61659743246332"/>
            <Dimensions width="0" height="0"/>
          </BoundingBox>
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="51.259611572039603" y="488.79170642040413"/>
                <End x="39.095462126042776" y="498.44148844452252"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_85" name="MetabReferenceGlyph" metaboliteGlyph="Layout_10" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="51.259611572039603" y="488.79170642040413"/>
                    <End x="99.141494459968726" y="468.65585369536723"/>
                    <BasePoint1 x="63.423761018036487" y="479.14192439628573"/>
                    <BasePoint2 x="84.323665100501813" y="471.48644353979688"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_86" name="MetabReferenceGlyph" metaboliteGlyph="Layout_26" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="39.095462126042776" y="498.44148844452252"/>
                    <End x="3.3895278320258626" y="552.90129625521763"/>
                    <BasePoint1 x="26.931312680045892" y="508.09127046864091"/>
                    <BasePoint2 x="12.11938289453667" y="532.90872886795887"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
      </ListOfReactionGlyphs>
      <ListOfTextGlyphs>
        <TextGlyph key="Layout_87" name="TextGlyph" graphicalObject="Layout_3" originOfText="Metabolite_0">
          <BoundingBox>
            <Position x="551.99004442214482" y="329.94225476685892"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_88" name="TextGlyph" graphicalObject="Layout_4" originOfText="Metabolite_1">
          <BoundingBox>
            <Position x="437.06148880358137" y="321.67948810708003"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_89" name="TextGlyph" graphicalObject="Layout_5" originOfText="Metabolite_7">
          <BoundingBox>
            <Position x="510.27689191817012" y="364.30499714053235"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_90" name="TextGlyph" graphicalObject="Layout_6" originOfText="Metabolite_4">
          <BoundingBox>
            <Position x="169.95293033258486" y="203.2602105802589"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_91" name="TextGlyph" graphicalObject="Layout_7" originOfText="Metabolite_6">
          <BoundingBox>
            <Position x="294.28912299558442" y="486.38216595903737"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_92" name="TextGlyph" graphicalObject="Layout_8" originOfText="Metabolite_2">
          <BoundingBox>
            <Position x="255.71922891944405" y="255.28030341558701"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_93" name="TextGlyph" graphicalObject="Layout_9" originOfText="Metabolite_3">
          <BoundingBox>
            <Position x="447.87636164753962" y="127.93525672511555"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_94" name="TextGlyph" graphicalObject="Layout_10" originOfText="Metabolite_5">
          <BoundingBox>
            <Position x="104.14149445996873" y="447.90347601403369"/>
            <Dimensions width="32" height="24"/>
          </BoundingBox>
        </TextGlyph>
      </ListOfTextGlyphs>
    </Layout>
  </ListOfLayouts>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
