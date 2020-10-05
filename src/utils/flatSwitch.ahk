class Flat_Switch  {
    __New(x,y,w:=19,Text:="Text",Font:="Arial",FontSize:= "10 Bold",FontColor:="FFFFFF",Window:="1",Background_Color:="36373A",State:=0,Label:=""){
        This.State:=State
        This.X:=x
        This.Y:=y
        This.W:=w
        This.H:=21
        This.Text:=Text
        This.Font:=Font
        This.FontSize:=FontSize
        This.FontColor:= "0xFF" FontColor
        This.Background_Color:= "0xFF" Background_Color
        This.Window:=Window
        This.Create_Off_Bitmap()
        This.Create_On_Bitmap()
        This.Create_Trigger()
        This.Label:=Label
        sleep,20
        if(This.State)
            This.Draw_On()
        else
            This.Draw_Off()
    }
    Create_Trigger(){
        Gui , % This.Window ": Add" , Picture , % "x" This.X " y" This.Y " w" This.W " h" This.H " 0xE hwndhwnd"
        This.Hwnd:=hwnd
        BD := THIS.Switch_State.BIND( THIS ) 
        GUICONTROL +G , % This.Hwnd , % BD
    }
    Create_Off_Bitmap(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , 21 ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( This.Background_Color )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
        Gdip_DeletePen( Pen )
        Brush := Gdip_BrushCreateSolid( "0xFF262827" )
        Gdip_FillRoundedRectangle( G , Brush , 1 , 2 , 26 , 13 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF303334" )
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 24 , 11 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0x8827282B" )
        Gdip_FillEllipse( G , Brush , 0 , 0 , 18 , 18 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
        Gdip_FillEllipse( G , Brush , 0 , 0 , 17 , 17 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 1 , 1 , 15 , 15 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF4D5055" , "0xFF36383B" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 2 , 2 , 13 , 13 )
        Gdip_DeleteBrush( Brush )
        ;Adding text
        ;-------------------------------------------------------------
        Brush := Gdip_BrushCreateSolid( This.FontColor )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " vCenter c" Brush " x33 y0" , This.Font , This.W-33, This.H )
        Gdip_DeleteBrush( Brush )
        ;-------------------------------------------------------------
        Gdip_DeleteGraphics( G )
        This.Off_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Create_On_Bitmap(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , 21 ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( This.Background_Color )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
        Gdip_DeletePen( Pen )
        ;------------------------------------------------------------------
        ;On Background Colors
        Brush := Gdip_BrushCreateSolid( "0xFF00518C" )      
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 25 , 11 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF4682C2" )
        ;--------------------------------------------------------------------
        Gdip_FillRoundedRectangle( G , Brush , 2 , 5 , 23 , 9 , 4 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0x8827282B" )
        Gdip_FillEllipse( G , Brush , 11 , 0 , 18 , 18 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
        Gdip_FillEllipse( G , Brush , 11 , 0 , 17 , 17 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 12 , 1 , 15 , 15 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF4D5055" , "0xFF36383B" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 13 , 2 , 13 , 13 )
        Gdip_DeleteBrush( Brush )
        ;Adding text
        ;-------------------------------------------------------------
        Brush := Gdip_BrushCreateSolid( This.FontColor )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " vCenter c" Brush " x33 y0" , This.Font , This.W-33, This.H )
        Gdip_DeleteBrush( Brush )
        ;-------------------------------------------------------------
        Gdip_DeleteGraphics( G )
        This.On_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Switch_State(){
        (This.State:=!This.State)?(This.Draw_On()):(This.Draw_Off())
        if(This.Label)  
            gosub,% This.Label
    }
    Draw_Off(){
        SetImage( This.Hwnd , This.Off_Bitmap )
    }
    Draw_On(){
        SetImage( This.Hwnd , This.On_Bitmap )
    }
}