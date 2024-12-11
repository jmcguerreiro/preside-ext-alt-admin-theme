<cfscript>
	itemClass     = args.itemClass ?: "";
	itemIcon      = args.itemIcon  ?: ( args.icon         ?: "" );
	itemLink      = args.itemLink  ?: ( args.link         ?: "" );
	itemTitle     = args.itemTitle ?: ( args.title        ?: "" );
	itemid        = args.itemId    ?: ( args.id           ?: "" );
	subMenu       = args.subMenu   ?: "";
	subitems      = args.subitems  ?: ( args.subMenuItems ?: [] );
	showMenuIcons = IsTrue( getSetting( "admin.topNavMenuIcons" ) );
	active        = IsTrue( args.active ?: "" );
	separator     = IsTrue( args.separator ?: "" );
	hasSubMenu    = Len( Trim( subMenu ) ) || ArrayLen( subitems );
</cfscript>
<cfoutput>
	<cfif !separator>
		<cfif !hasSubmenu>
			<cfif len( trim( itemLink ) )>
				<li class="#itemClass#" data-item-id="#EncodeForHtmlAttribute( itemid )#">
					<a href="#itemLink#"<cfif active> class="active"</cfif>>
						<cfif showMenuIcons && Len( Trim( itemIcon ) )>
							<i class="fa fa-fw #itemIcon#"></i>&nbsp;
						</cfif>
						#itemTitle#
					</a>
				</li>
			</cfif>
		<cfelse>
			<li class="#itemClass#" data-item-id="#itemid#">
				<a href="##" data-toggle="preside-dropdown" class="dropdown-toggle<cfif active> active</cfif>">
					<cfif showMenuIcons && Len( Trim( itemIcon ) )>
						<i class="fa fa-fw #itemIcon#"></i>&nbsp;
					</cfif>
					#itemTitle#
					<i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-close dropdown-menu-left">
					<cfif Len( Trim( subMenu ) )>
						#subMenu#
					<cfelse>
						<cfloop array="#subitems#" item="item" index="i">
							<cfif IsTrue( item.spacer ?: "" )>
								<li class="spacer"><hr></li>
							<cfelse>
								<li>
									<a href="#item.link#" data-item-id="#EncodeForHtmlAttribute( item.id ?: '' )#">
										<cfif Len( Trim( item.icon ?: "" ) )>
											<i class="fa fa-fw #item.icon#"></i>&nbsp;
										</cfif>
										#item.title#
									</a>
								</li>
							</cfif>
						</cfloop>
					</cfif>
				</ul>
			</li>
		</cfif>
	</cfif>
</cfoutput>