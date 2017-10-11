===============================
BIG-IP as SAML SP Configuration
===============================

This document describes the configuration steps for configuring an external IDP Connector using an IDP Connector template in Access Guided Configuration's SAML Service Provider workflow.

#. Logon to BIG-IP using UI and click on Access -> Guided Configuration
#. Select Federation category of use case configuration
#. Choose SAML Service Provider for configuration BIG-IP as SAML Service Provider.
#. Review Required Configuration and complete steps to configure before configuring the External IDP Connector.
#. Service Provider.
#. Virtual Server.
#. After completing the External IDP connector, complete the Pool Settings and the optional Endpoint and SSO settings.

External IDP Connector Configuration in AGC workflow
----------------------------------------------------

(Note - Only one  IDP Connector can be configured for a Service Provider.)

Under the External Identity Provider Connector Settings, first Select **Template**  option for the method to configure your IDP connector. Then choose an Identity Provider from the provided set. Search for BIG-IP IdP in the Search bar. (If you cannot find an Identity Provider which you are looking for in the set, then you can use the other options like "Metadata"  or "Custom"  and proceed with the configuration.)

Select BIG-IP IdP and click Add button. Enter a name for the connector.

IDP Connector Specific Properties
---------------------------------

To configure BIG-IP IdP provide following inputs:
	- **IdP Hostname** : Provide the hostname of your Identity Provider.
	- **Scheme** : Select the protocol.

Advanced Connector Settings
---------------------------

If the default basic settings do not work for you, you can go to Advanced Settings by clicking on **Show Advanced Settings**.

Endpoint Settings
~~~~~~~~~~~~~~~~~

Select **POST/Redirect**  as your Single Sign-on Service Binding.

Assertion Settings
~~~~~~~~~~~~~~~~~~

Specify the Identity Location whether it is **Subject** or **Attribute**.

Security Settings
~~~~~~~~~~~~~~~~~

Select **Yes**  if you need the Authentication to be signed and select the appropriate signing algorithm.

Certificate Settings
~~~~~~~~~~~~~~~~~~~~

Select **Yes**  if you want to detach signature when using the redirect binding.

Click **Save & Next**. Complete the subsequent steps and then deploy the configuration.

Go to **Access -> Federation -> SAML Service Provider -> Local SP Services**, identify the SAML SP object created by your workflow, select it and click Export Metadata. This is the SAML metadata file which can be used to configure the Service Provider configuraton in the external Identity Provider Administration console.


Setup BIG-IP IdP as Identity Provider
-------------------------------------------


Testing your configuration
--------------------------

#. To test the configuration, click on the "Click to test configuration" link on the AGC Summary page.
#. Provide the test user's credentials and verify if the access to backend application succeeds.
