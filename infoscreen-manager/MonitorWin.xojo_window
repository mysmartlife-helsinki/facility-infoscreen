#tag Window
Begin Window MonitorWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Monitor Screen"
   Visible         =   True
   Width           =   600
   Begin Canvas monCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin Timer animTimer
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   20
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  me.left = (screen(0).width/2 - me.width/2)
		  me.top = 120
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		anim1step As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		anim2step As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		anim3step As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		animStage As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		points(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h0
		points2(-1) As double
	#tag EndProperty


#tag EndWindowCode

#tag Events monCanvas
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim sx,sy,posy as integer
		  
		  dim i as integer
		  
		  // values for testing
		  
		  // paint background
		  
		  g.ForeColor = app.kHelKesa
		  g.FillRect( 0, 0, g.Width, g.Height )
		  
		  g.ForeColor = app.kHelTiili
		  
		  // chart shape 
		  
		  posy = me.height/2
		  
		  if animStage<3 then //draw filled polygon, then unfilled
		    
		    redim points(-1)
		    redim points2(-1)
		    
		    points.append 0 // filler because FillPolygon will start from index 1
		    points2.append 0
		    
		    for i = 1 to 600
		      
		      points.append i // X
		      points2.append i
		      
		      points.append (anim1step/100)*20*sin(0.05*(i))+200 // Y
		      points2.append (anim1step/100)*20*sin(0.05*(i))+201 // Y
		      
		    next
		    
		    points.append me.width
		    points2.append me.width
		    points.append me.height
		    points2.append me.height
		    points.append 0
		    points2.append 0
		    points.append me.height
		    points2.append me.height
		    points.append 0
		    points2.append 0
		    points.append 20*sin(0.05)+200
		    points2.append 20*sin(0.05)+201
		    
		  end
		  
		  SELECT CASE animStage
		    
		  CASE 1
		    g.FillPolygon(points)
		  CASE 2
		    g.DrawPolygon(points)
		    g.DrawPolygon(points2)
		  CASE 3
		    
		    
		    
		    for i = 0 to 1200 step 2
		      
		      if i<600 then
		        points(i) = points(i) + (5 * (600 - i)/600 )
		        points2(i) = points2(i) + (5 * (600 - i)/600 )
		      else
		        points(i) = points(i) - (5 * (i - 600)/600 )
		        points2(i) = points2(i) - (5 * (i - 600)/600 )
		      end
		      
		    next
		    
		    g.DrawPolygon(points)
		    g.DrawPolygon(points2)
		    
		  END SELECT
		  
		  
		  // draw Rectangle
		  
		  // g.FillRect(me.width/2,0,me.width/2,100)
		  
		  // draw text captions
		  
		  Dim s As New StringShape
		  s.X = 20
		  s.TextFont = "Tahoma" //"Gangster Grotesk Bold"
		  s.Text = "KIINTEISTÖN ENERGIANKULUTUS"
		  s.TextSize = 24
		  s.HorizontalAlignment = StringShape.Alignment.Left
		  s.Y = 40
		  g.DrawObject(s)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events animTimer
	#tag Event
		Sub Action()
		  if anim1step<101 then
		    animStage = 1
		  else
		    if animStage = 1 then animStage = 2
		  end
		  
		  if anim2step > 100 then
		    if animStage = 2 then animStage = 3
		  end
		  
		  SELECT CASE animStage
		    
		  CASE 1
		    anim1step = anim1step + 1
		  CASE 2
		    anim2step = anim2step + 1
		  CASE 3
		    anim3step = anim3step + 1
		  CASE 4
		    
		  END SELECT
		  
		  monCanvas.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
