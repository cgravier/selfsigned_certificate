# selfsigned_certificate cookbook

This cookbook allow you to create a self signed certificate using openssl. The certificate is configured using the provided attributes.

# Requirements

No requirement. Openssl package will be installed along the default recipe.

# Usage

You can generate the self-signed certificate once, using : 
```
if !(File.exist? node['selfsigned_certificate']['destination'])
	log "No self-signed certificate found (targeted destination: #{node['selfsigned_certificate']['destination']}"
	include_recipe "selfsigned_certificate::default" 
	log "created th server self-signed certificate to #{node['selfsigned_certificate']['destination']}"
else 
	log "Certificate already exists in #{node['selfsigned_certificate']['destination']}, no overriding."
end
```

(because include_recipe is a ruby instruction !)

## Testing 

You can test the cookbook using the provided <code>Vagrantfile</code>. Make sure you edit sample attribute provided in the Vagrantfile to match your test needs.

Unit tests are provided by the mean of <code>kitchen-test</code>. You can run the test (for now only one teesting certificate creation) by running :
    kitchen test



Beware: vagrant 1.2.x aka Vagrant 2 is mandatory.

## Depending on this cookbook

1. Make your cookbook depends on this cookbook (e.g. in your Berksfile if you are using berkshelf, and in your metadata).
2. You _must_ override all the attributes as described below, except <code>node.selfsigned_certifcate[:destination]</code> which is recommended but not compulsory.
3. Call the recipe using <code>include_recipe 'selfsigned_certificate'</code>
4. You can then use the generated certificate in your own template using the attribute <code>node.selfsigned_certifcate[:destination]/server.crt</code> (and <code>.key</code>), for instance for nginx or Apache configuration.

# Attributes

* <code>node.selfsigned_certifcate[:destination]</code> : Where to store the created self-signed certificate.
* <code>node.selfsigned_certifcate[:sslpassphrase]</code> : The passphrase used to generate the request for signature and self CA signature. Obviously very sensible, you should configure it in your attribute files using a databag.
* <code>node.selfsigned_certifcate[:country]</code> : Country code for the certificate.
* <code>node.selfsigned_certifcate[:state]</code> : State for the certificate.
* <code>node.selfsigned_certifcate[:city]</code> : City for the certificate.
* <code>node.selfsigned_certifcate[:orga]</code> : Organisation for the certificate.
* <code>node.selfsigned_certifcate[:depart]</code> : Departement for the certificate.
* <code>node.selfsigned_certifcate[:cn]</code> : Common name for the certificate.
* <code>node.selfsigned_certifcate[:email]</code> : Contact email for the certificate.

# Recipes

Default recipe in current version.

# Author

Author:: Christophe Gravier (<christophe.gravier@univ-st-etienne.fr>)

Licence:: [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0)
