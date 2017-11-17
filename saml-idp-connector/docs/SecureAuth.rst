========================================================================
IdP Connector Configuration Guide : SecureAuth
========================================================================

BIG-IP as SAML SP Configuration
-------------------------------
This document describes the configuration for an external IDP Connector using an IDP Connector template in the Guided Configuration SAML Service Provider workflow. Follow the steps below to configure SecureAuth:

#. Logon to the BIG-IP user interface and click ``Access -> Guided Configuration``.
#. Select the ``Federation`` category.
#. Select the ``SAML Service Provider`` to configure BIG-IP as a SAML Service Provider.
#. Review the Required Configuration information and complete the following required steps before you configure the External IDP Connector.

- Provide the ``Service Provider`` details.
- Provide the ``Virtual Server`` configuration details.
- After you configure the External IDP connector, configure the Pool Settings and (optional) Endpoint Check and SSO settings.

External IDP Connector Configuration in Guided Configuration
------------------------------------------------------------

.. note::  Saml SP configuration supports only one IDP Connector for a Service Provider.

#. On the External Identity Provider Connector Settings screen, select the ``Template``  method.
#. Select the Identity Provider from the provided set. You can search for SecureAuth in the Search bar. If a template for your application is not available, you can use the options *Metadata* or *Custom*, and configure the Identity Providers accordingly.

Select SecureAuth and click ``Add``. Specify a name for the connector.

IDP Connector Specific Properties
---------------------------------

To configure SecureAuth provide following inputs:
	- ``Entity ID (SAML Issuer)`` : Provide the entity ID.
	- ``Single Sign-on Service URL`` : Set the URL to the Fully Qualified Domain Name (FQDN) of the SecureAuth IdP appliance followed by the realm number of the integration and secureauth.aspx. For eg- https://secureauth.company.com/secureauth12/secureauth.aspx.

Advanced Connector Settings
---------------------------

If the basic settings do not provide the information you need to configure, show Advanced Settings by clicking ``Show Advanced Settings``.

Endpoint Settings
~~~~~~~~~~~~~~~~~

Select ``POST/Redirect``  as your Single Sign-on Service Binding.

Assertion Settings
~~~~~~~~~~~~~~~~~~

Specify whether the Identity Location is ``Subject`` or ``Attribute``.

Security Settings
~~~~~~~~~~~~~~~~~

Select ``Yes`` to sign Authentication requests, and select the appropriate signing algorithm.

Certificate Settings
~~~~~~~~~~~~~~~~~~~~

Select ``Yes``  if you want to detach the signature when using the redirect binding.

Click ``Save & Next``. Complete the subsequent steps.

Deploy the Configuration
------------------------

#. Deploy the configuration from the ``Summary`` screen.
#. To retrieve the metadata for this configuration, navigate to ``Access -> Federation -> SAML Service Provider -> Local SP Services``.
#. Select the SAML SP object created by your workflow, and click ``Export Metadata``.
#. Use the SAML metadata file to configure the Service Provider configuraton in the external Identity Provider Administration console.

Setup SecureAuth as Identity Provider
-------------------------------------------------------------


Test the configuration
----------------------

#. To test the configuration, click on the link *Click to test configuration* link on the Summary page.
#. Provide test user credentials, and verify that the access to the backend application succeeds.
