=================================================================
SaaS Application Configuration Guide : UserVoice
=================================================================

BIG-IP as SAML IdP Configuration
--------------------------------
This document describes configuration steps for configuring an AGC SAML Identity Provider for SaaS Application workflow using a SaaS Application template. Follow the steps below to configure UserVoice:

#. Logon to BIG-IP using UI and click on **Access -> Guided Configuration**
#. Select **Federation** category of use case configuration
#. Choose **SAML Identity Provider for SaaS Application** for configuring BIG-IP as SAML Identity Provider
#. Review **Required Configuration** and complete the following workflow steps before configuring the SaaS Application

#. Identity Provider
#. Virtual Server
#. Authentication method to use for SAML Identity Provider
#. After completing SaaS Application Configuration, complete Endpoint Checks and Customization configuration steps

UserVoice Configuration in AGC Workflow
----------------------------------------------

The SaaS Application step displays a list of SaaS Applications that can be configured as SAML Service Provider Application. Select a specific SaaS Application and click Add.
For example to configure
UserVoice, select
UserVoice and click on **Add** button

Common SaaS Application Properties
----------------------------------

#. Enter application name. This is used by APM to internally identify the configuration details for the SaaS application and SAML service provider for it.
#. Select if application supports IDP Initiated requests. If IdP Initiated is selected, application resource is displayed on Webtop.
#. Enter or modify Caption, this is used to display the application resource on the Webtop
#. Enter Description (optional) for this application

SaaS Application Specific Properties
------------------------------------

To configure UserVoice provide following inputs:
	- **Sub Domain** : Provide the sub domain. For eg - If the URL is company.uservoice.com, then the sub domain is company.

Additional SAML Attributes and ACS Properties
---------------------------------------------

#. Configure any additional attribute values which must be send in the SAML assertion to SaaS Application. SAML Attribute has a attribute name and attribute value. Attribute value can be specified from session variables which are set by specific authentication method or from result of a query against LDAP or Active Directory.
#. Configure any additional Assertion Consumer Service URI that are required by SaaS Application.

Security Properties
-------------------
#. Select if assertion and response must be signed.
#. Select if it requires Authentication Requests must be signed. It so, configure signing certificate.
#. Select if assertions must be encrypted. If so, configure encryption algorithm and encryption certificate.
#. Complete the workflow configuration by configuring any endpoint checks and customization configuration.

Deploy the Configuration
------------------------
#. Click **Access > Federation > Saml Identity Provider > Local Idp Services**.
#. Identify the Saml SSO object created for for UserVoice and export SAML Metadata.

You can use the exported IdP SAML Metadata to configure the IdP Provider configuration in UserVoice service.

Test the Configuration
---------------------------------

#. After configuration is deployed, click on **Summary** step of the configuration.
#. On Summary page, **Click to test configuration** link launches a browser window connecting to the Virtual Server configured in the workflow.
#. After successful logon, Webtop with IdP Initiated Applications is displayed.

