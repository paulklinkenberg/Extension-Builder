<cfparam name="rc.info" default="#{}#">
<cfparam name="rc.message" default="">
<cfoutput>
	
<cffunction name="v" output="false">
	<cfargument name="f">
	<cfreturn StructKeyExists(rc.info, f) ? Trim(rc.info[f]) : "">
</cffunction>	

<cfsavecontent variable="js">
	<script>
		var categories ="Framework,CMS,Core,Gateway,Database,Forum,E-Commerce,Demo".split(",");
		
		$('.typeahead').typeahead({
				source:categories
		});
	</script>
</cfsavecontent>

<cfset arrayAppend(rc.js, js)>





<div class="row-fluid">
	<div class="span2">
		<cfinclude template="localnav.cfm">
	</div>
	<div class="span10">
	<h1>Edit #v("label")#</h1>
	
	<cfif Len(rc.message)>
		<div class="alert alert-success">
		<a class="close" data-dismiss="alert">x</a>
		#rc.message#</div>
	</cfif>
	
	<form action="#buildURL("extension.saveinfo")#" method="post">
		
	<div class="row">
		<div class="span6">
			<fieldset>
			 	<legend>Extension Information</legend>
			 	<div>
					<label for="label">Display Name</label>
					<input type="text" name="label" value="#v("label")#" id="label" placeholder="My Great Extension">
				</div>
				<div>
			 		<label>Short Name:</label>
					#v("name")#
			 		<input type="hidden" name="name" value="#v("name")#" id="Name" placeholder="MyExtension"/>	
			 	</div>
				<div>
					<label for="author">Author</label>
					<input type="text" name="author" value="#v("author")#" id="author" placeholder="John Smith">
				</div>
				<div>
					<label for="version">Version</label>
					<input type="text" name="version" value="#v("version")#" id="version" placeholder="1.0.0">
				</div>
			 	<div>
					<label for="type">Type (was #v("type")#)</label>
					<select name="type" id="type">
						<cfset type= v("type")>
						<option value="server" <cfif type EQ "server">selected</cfif>>Server</option>
						<option value="web" <cfif type EQ "web">selected</cfif>>Web</option>			
					</select>
					 <p class="help-block">If this extension should be availbel to the whole server, or a specific web context</p>
			 	</div>
			
				<div>
					<label for="description">Description</label>
					<textarea name="description" rows="8" cols="40">#v("description")#</textarea>
				</div>
				
				<div>
					<label for="category">Category</label>
					<input type="text" name="category" class="typeahead" value="#v("category")#" id="category" placeholder="Gateway">
				</div>
				</fieldset>
		</div>
		<div class="span6">
			<fieldset>
				<legend>Resources</legend>	
				<div>
					<label for="imgurl">Image URL</label>
					<input type="text" name="image" value="#v("image")#" id="image" placeholder="http://mydomain.com/image.png">
				</div>
			 	<div>
					<label for="mailinglist">Mailing List</label>
					<input type="text" name="mailinglist" value="#v("mailinglist")#" id="mailinglist" placeholder="http://groups.google.com/group/railo-beta">
				</div>
				
				<div>
					<label for="supportURL">Support URL</label>
					<input type="text" name="support" value="#v("support")#" id="supportURL" placeholder="http://groups.google.com/group/railo-beta">
				</div>
				
				<div>
					<label for="documentationURL">Documentation URL</label>
					<input type="text" name="documentation" value="#v("documentation")#"id="documentationURL" placeholder="http://groups.google.com/group/railo-beta">
				</div>
			</fieldset>
			
			<fieldset>
				<legend>Payment Information</legend>
				<div>
					<label for="paypal">Paypal Address</label>
					<input type="text" name="paypal" value="#v("paypal")#" id="paypal" placeholder="joe.user@mydomain.com">
				</div>			
			</fieldset>
		</div>
	
	</div>
		<div class="form-actions">
            <button type="submit" class="btn btn-primary">Save Information</button>
            <button class="btn" type="reset">Cancel</button>
          </div>
</form>	

	</div>
</div>	


</cfoutput>