#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  SplashWin.ShowModal
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpOnTheWeb() As Boolean Handles HelpOnTheWeb.Action
			ShowURL("https://www.mysmartlife.eu")
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Note, Name = Copyright
		
		Icons made by Freepik from www.flaticon.com
	#tag EndNote


	#tag Constant, Name = kAPIToken, Type = String, Dynamic = False, Default = \"HKoZ4Dfx0GWnJwnDQNsaiuq7auCvTeOb", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kHelBussi, Type = Color, Dynamic = False, Default = \"&c0000BF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelEngel, Type = Color, Dynamic = False, Default = \"&cFFE977", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelKesa, Type = Color, Dynamic = False, Default = \"&cFFC61E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelMetro, Type = Color, Dynamic = False, Default = \"&cFD4F00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelSumu, Type = Color, Dynamic = False, Default = \"&c9FC9EB", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelSuomenlinna, Type = Color, Dynamic = False, Default = \"&cF5A3C7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHelTiili, Type = Color, Dynamic = False, Default = \"&cBD2719", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
