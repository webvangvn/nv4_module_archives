<!-- BEGIN: main -->
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>

<div class="table-responsive">
<!-- BEGIN: list -->
<table class="table table-striped table-bordered table-hover">
	<thead>
        <tr>
            <td class="w100"><strong>{LANG.weight}</strong></td>
            <td class="w250"><strong>{LANG.title}</strong></td>
            <td class="w250"><strong>{LANG.alias}</strong></td>
            <td class="w100"><strong>{LANG.inhome}</strong></td>
            <td class="w100"><strong>{LANG.viewcat_page}</strong></td>
            <td class="w100"><strong>{LANG.numlinks}</strong></td>
            <td class="w200"></td>
        </tr>
    </thead>
    <!-- BEGIN: loop -->
    <tbody {ROW.class}>
        <tr>
            <td align="center">{ROW.sweight}</td>
            <td><a href="{ROW.linkparent}"><strong>{ROW.title} ({ROW.numsubcat})</strong></a></td>
            <td>{ROW.alias}</td>
            <td align="center">{ROW.sinhome}</td>
            <td align="center">{ROW.sviewcat}</td>
            <td align="center">{ROW.snumlinks}</td>
            <td align="center">
            	<span class="add_icon"><a href="{ROW.add}">{LANG.addcontent}</a></span>&nbsp;
            	<span class="edit_icon"><a href="{ROW.edit}">{LANG.edit}</a></span>&nbsp;
                <span class="delete_icon"><a href="{ROW.del}">{LANG.del}</a></span> 
            </td>
        </tr>
    </tbody>	
    <!-- END: loop -->
</table>
<!-- END: list --> 
</div>
<!-- BEGIN: form -->
<div id="edit">
	<!-- BEGIN: error -->
    <div class="quote" style="width:98%">
    	<blockquote class="error"><span>{ERROR}</span></blockquote>
    </div>
    <div class="clear"></div>
	<!-- END: error -->
    <form class="form-inline m-bottom" action="" method="post">
    <input class="form-control" name="save" type="hidden" value="1" />
    <input class="form-control" name="parentid_old" type="hidden" value="{DATA.parentid}" />
	<div class="table-responsive">
		<table class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td><strong>{LANG.title}: </strong></td>
					<td><input class="form-control" style="width: 600px" name="title" type="text" value="{DATA.title}" maxlength="255" id="idtitle"/></td>
				</tr>
			</tbody>
			<tbody class="second">
				<tr>
					<td><strong>{LANG.alias}: </strong></td>
					<td>
						<input class="form-control" style="width: 550px" name="alias" type="text" value="{DATA.alias}" maxlength="255" id="idalias"/>
						&nbsp; <em class="fa fa-refresh fa-lg fa-pointer" onclick="get_alias();">&nbsp;</em>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td><strong>{LANG.cat_parent}: </strong></td>
					<td>
					<select id="sel-cat" class="form-control" name="parentid">
						<option value="0" {ROW.select}>{LANG.parent_main}</option>
						<!-- BEGIN: catlist -->
						<option value="{ROW.catid}" {ROW.select}>{ROW.xtitle}</option>
						<!-- END: catlist -->
					</select>
					</td>
				</tr>
			</tbody>
			<tbody class="second">
				<tr>
					<td><strong>{LANG.keywords}: </strong></td>
					<td><input class="form-control" style="width: 600px" name="keywords" type="text" value="{DATA.keywords}" maxlength="255" /></td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td valign="top"><strong>{LANG.description} </strong></td>
					<td>
					<textarea class="form-control" style="width: 600px" name="description" cols="100" rows="5">{DATA.description}</textarea>
					</td>
				</tr>
			</tbody>
			<tbody id="id_groups_view">
			<tr>
				<td><strong>{LANG.groups_view}</strong></td>
				<td>
						<!-- BEGIN: groups_views -->
						<div class="row"><input class="form-control" name="groups_view[]" type="checkbox" value="{groups_views.value}" {groups_views.check} />{groups_views.title}</div>
						<!-- END: groups_views -->
				</td>
			</tr>
			</tbody>
			<tbody>
				<tr><td colspan="2" align="center">
					<input class="btn btn-primary" name="submit1" type="submit" value="{LANG.save}" />
				</td></tr>
			</tbody>
		</table>
	</div>
</form>
</div>
<script type="text/javascript">
<!-- BEGIN: getalias -->
$("#idtitle").change(function () {
    get_alias();
});
<!-- END: getalias -->
$(document).ready(function() {
	$("#sel-cat").select2();
});
</script>
<!-- END: form -->
<!-- END: main -->

<!-- BEGIN: catdel -->
<!-- BEGIN: subcat -->
<div class="text-center">
	<p align="center">{TITLE}</p>
	<input class="form-control" type="button" value="{LANG.viewsubcat}" onclick="window.location='{PURL}'" />
</div>    
<!-- END: subcat-->
<!-- BEGIN: nonecat -->
<div class="text-center">
	<p align="center">{TITLE}</p>
	<form action="" method="post">
	<input class="form-control" type="hidden" name="del" value="1" />
	<input class="form-control" type="submit" value="{LANG.del_ok}"/>
	<input class="form-control" type="button" value="{LANG.no}" onclick="window.location='{PURL}'" />
</div>    
<!-- END: nonecat-->
<!-- BEGIN: havecat -->
<p align="center"><strong>{TITLE}</strong></p>

<div class="well text-center">
	<p align="center">{TITLE1}</p>
	<br/>
	<form action="" method="post">
	<input class="form-control" type="hidden" name="delcatall" value="1" />
	<input class="btn btn-primary" type="submit" value="{LANG.del_ok}"/>
	</form>
</div>  
	<br/>
	<br/>

<div class="well text-center">
	<p align="center">{TITLE2}</p>
	<br/>
	<form action="" method="post">
	<input class="form-control" type="hidden" name="delcatmove" value="1" />
	<select class="form-control w300 text-center" name="catid" style="display: inline-block">
		<!-- BEGIN: catlist -->
		<option value="{ROW.catid}" {ROW.select}>{ROW.xtitle}</option>
		<!-- END: catlist -->
	</select>
	<br/>
	<br/>
	<input class="btn btn-primary" type="submit" value="{LANG.move_and_del}"/>
	</form>
</div>  
<div class="text-center">
	<input class="btn btn-warning w200 center-block" type="button" value="{LANG.no}" onclick="window.location='{PURL}'" />
</div>
<!-- END: havecat-->
<!-- END: catdel -->