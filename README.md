# selfsigned_certificate cookbook

This cookbook allow you to create a self signed certificate using openssl. The certificate is configured using the provided attributes.

# Requirements


# Usage

1. Make your cookbook depends on this cookbook.
2. You _must_ override all the attributes as described below.
3. Call the recipe using <code>include_recipe 'selfsigned_certificate'</code>
4. You can then use the generated certificate in your own template using the attribute <code>node.selfsigned_certifcate[:destination]/server.crt</code> (and <code>.key</code>), for instance for nginx or Apache configuration.

# Attributes

* <code>node.selfsigned_certifcate[:destination]</code> : Where to store the created self-signed certificate.
* <code>node.selfsigned_certifcate[:passphrase]</code> : The passphrase used to generate the request for signature and self CA signature. Obviously very sensible, you should configure it in your attribute files using a databag.
* <code>node.selfsigned_certifcate[:country]</code> : Country code for the certificate.
* <code>node.selfsigned_certifcate[:state]</code> : State for the certificate.
* <code>node.selfsigned_certifcate[:city]</code> : City for the certificate.
* <code>node.selfsigned_certifcate[:orga]</code> : Organisation for the certificate.
* <code>node.selfsigned_certifcate[:depart]</code> : Departement for the certificate.
* <code>node.selfsigned_certifcate[:cn]</code> : Common name for the certificate.
* <code>node.selfsigned_certifcate[:email]</code> : Contact email for the certificate.

# Recipes

Default recipe in current version.

# TODO

* Test vagrant file
* Unit tests

# Author

Author:: Christophe Gravier (<christophe.gravier@univ-st-etienne.fr>)
Licence:: [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0)
