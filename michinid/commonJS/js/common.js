function menuSetNon ( container , active )
{
	this.container = container;
	this.interval;
	this.prevMenuOver = -1;

	if ( active == undefined ) 
	{
		this.active = true;
	}
	else
	{
		this.active = active;
	}

	this.OVER = -1;
	this.menuMake();
}

menuSetNon.prototype.menuMake = function()
{
	var owner = this;

	this.container.find ( "li div").css ( { opacity:0 , cursor:"pointer" } );
	this.container.mouseover ( over ).mouseout ( out );

	function over ( e )
	{
		if ( $(e.target).attr ( "class" ) == owner.container.attr("class") ) return;
		var index = $(e.target).parent().parent().index();
		owner.menuCheck( index );		
	}

	function out ( e )
	{
		if ( $(e.target).attr ( "class" ) == owner.container.attr("class") ) return;
		var index = $(e.target).parent().parent().index();
		owner.menuCheck( owner.OVER );
	}
}
menuSetNon.prototype.menuCheck = function ( num )
{
	this.container.find ( "li div" ).each ( function ( i )
	{
		var opa = ( i == num ) ? 1 : 0;
		$(this).stop().animate ( { opacity:opa } , 250 );
	} );
}