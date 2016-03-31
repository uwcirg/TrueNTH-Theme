AUI().ready( 'liferay-navigation-interaction',
	function(A) {

		var navigation = A.one('#navigation');

		var menu_toggle = navigation.one('#nav_toggle');


		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		menu_toggle.on('click', function(event){
			navigation.one('.collapse.nav-collapse').toggleClass('open');
		});
	}
);