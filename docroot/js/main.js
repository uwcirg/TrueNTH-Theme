AUI().ready( 'liferay-navigation-interaction',
	function(A) {

		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}
	}
);