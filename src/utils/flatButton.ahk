;-----------------------------------------------------------------
HB_Button_Hover(){
    Static Index , Hover_On
    MouseGetPos,,,, ctrl , 2
    if( ! Hover_On && ctrl ){
        loop , % HB_Button.Length()
            if( ctrl = HB_Button[ A_Index ].hwnd )
                HB_Button[ A_Index ].Draw_Hover() , Index := A_Index , Hover_On := 1 , break
    }else if( Hover_On = 1 )
        if( ctrl != HB_Button[ Index ].Hwnd )
            HB_Button[ Index ].Draw_Default() , Hover_On := 0
}
;-----------------------------------------------------------------
 
 class Flat_Button {
    __New( x := 10 , y := 10 , w := 150 , h := 40 , Button_Color := "FF0000" , Button_Background_Color := "222222" , Text := "Button" , Font := "Arial" , Font_Size := 16 , Font_Color_Top := "000000" , Font_Color_Bottom := "FFFFFF" , Window := "1" , Label := "" , Default_Button := 1, Roundness:=5 ){
        This.Roundness:=Roundness
        This.Text_Color_Top := "0xFF" Font_Color_Top 
        This.Text_Color_Bottom := "0xFF" Font_Color_Bottom 
        This.Font := Font 
        This.Font_Size := Font_Size 
        This.Text := Text
        This.X := x 
        This.Y := y 
        This.W := w 
        This.H := h 
        This.Button_Background_Color := "0xFF" Button_Background_Color 
        This.Button_Color := "0xFF" Button_Color 
        This.Window := Window
        This.Label := Label 
        This.Default_Button := Default_Button 
        This.Create_Default_Bitmap() 
        This.Create_Hover_Bitmap() 
        This.Create_Pressed_Bitmap() 
        This.Create_Trigger()
        sleep, 20
        This.Draw_Default()
    }
    Create_Trigger(){
        global
        num := HB_Button.Length()+1
        Gui , % This.Window ": Add" , Picture , % "x" This.X " y" This.Y " w" This.W " h" This.H " hwndHwnd v" Num " g" This.Label " 0xE"
        This.Number := Num , This.Hwnd := Hwnd
    }
    Create_Default_Bitmap(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , This.H ) ;96x29
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( This.Button_Background_Color )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , This.H+2 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , "0xFF61646A" , "0xFF2E2124" , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 0 , 1 , This.W , This.H-3 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        
        ;---------------------------------------------------
        if(This.Default_Button)
            Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , "0xFF4C4F54" , "0xFF35373B" , 1 , 1 )
        else    
            Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , This.Button_Color , "0xFF35373B" , 1 , 1 )
        ;-------------------------------------------    
            
        Gdip_FillRoundedRectangle( G , Brush , 1 , 2 , This.W-2 , This.H-5 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF1A1C1F" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 0 , 0 , This.W-1 , This.H-3 , This.Roundness )
        Gdip_DeletePen( Pen )
        Brush := Gdip_BrushCreateSolid( This.Text_Color_Bottom )
        Gdip_TextToGraphics( G , This.Text , "s" This.Font_Size " Center vCenter c" Brush " x1 y2 " , This.Font , This.W , This.H-1 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( This.Text_Color_Top )
        Gdip_TextToGraphics( G , This.Text , "s" This.Font_Size " Center vCenter c" Brush " x0 y1 " , This.Font , This.W , This.H-1 )
        Gdip_DeleteBrush( Brush )
        Gdip_DeleteGraphics( G )
        This.Default_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Create_Hover_Bitmap(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , This.H ) ;96x29
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( This.Button_Background_Color )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , This.H+2 )
        Gdip_DeleteBrush( Brush )
        
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , "0xFF61646A" , "0xFF2E2124" , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 0 , 1 , This.W , This.H-3 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        ;---------------------------------------------------------------------------
        if(This.Default_Button)
            Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , "0xFF55585D" , "0xFF3B3E41" , 1 , 1 )
            
        else 
            Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , "0x44A826A2" , "0xFF3B3E41" , 1 , 1 )
        ;----------------------------------------------------------------   
        Gdip_FillRoundedRectangle( G , Brush , 1 , 2 , This.W-2 , This.H-5 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF1A1C1F" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 0 , 0 , This.W-1 , This.H-3 , This.Roundness )
        Gdip_DeletePen( Pen )
        Brush := Gdip_BrushCreateSolid( This.Text_Color_Bottom )
        Gdip_TextToGraphics( G , This.Text , "s" This.Font_Size " Center vCenter c" Brush " x1 y2" , This.Font , This.W , This.H-1 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( This.Text_Color_Top )
        Gdip_TextToGraphics( G , This.Text , "s" This.Font_Size " Center vCenter c" Brush " x0 y1" , This.Font , This.W , This.H-1 )
        Gdip_DeleteBrush( Brush )
        Gdip_DeleteGraphics( G )
        This.Hover_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Create_Pressed_Bitmap(){
        pBitmap:=Gdip_CreateBitmap( This.W , This.H ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( This.Button_Background_Color )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , This.H+2 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , "0xFF2A2C2E" , "0xFF45474E" , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 0 , 1 , This.W , This.H-3 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF2A2C2E" )
        Gdip_FillRoundedRectangle( G , Brush , 0 , 0 , This.W , This.H-8 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF46474D" )
        Gdip_FillRoundedRectangle( G , Brush , 0 , 7 , This.W , This.H-8 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        ;------------------------------------------------------------------
        if(This.Default_Button)
            Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , This.W ,This.H-7 , "0xFF333639" , "0xFF43474B" , 1 , 1 )
        else 
            Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , This.W ,This.H-7 , "0xFF333639" , "0xFF0066aa" , 1 , 1 )
        ;-----------------------------------------------------------------------
        Gdip_FillRoundedRectangle( G , Brush , 1 , 2 , This.W-3 , This.H-6 , This.Roundness )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF1A1C1F" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 0 , 0 , This.W-1 , This.H-3 , This.Roundness )
        Gdip_DeletePen( Pen )
        Brush := Gdip_BrushCreateSolid( This.Text_Color_Bottom )
        Gdip_TextToGraphics( G , This.Text , "s" This.Font_Size " Center vCenter c" Brush " x1 y3" , This.Font , This.W , This.H-1 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( This.Text_Color_Top )
        Gdip_TextToGraphics( G , This.Text , "s" This.Font_Size " Center vCenter c" Brush " x0 y2" , This.Font , This.W , This.H-1 )
        Gdip_DeleteBrush( Brush )
        Gdip_DeleteGraphics( G )
        This.Pressed_Bitmap := Gdip_CreateHBITMAPFromBitmap( pBitmap )
        Gdip_DisposeImage( pBitmap )
    }
    Draw_Default(){
        SetImage( This.Hwnd , This.Default_Bitmap )
    }
    Draw_Hover(){
        SetImage( This.Hwnd , This.Hover_Bitmap )
    }
    Draw_Pressed(){
        SetImage( This.Hwnd , This.Pressed_Bitmap )
        SetTimer , HB_Button_Hover , Off
        While( GetKeyState( "LButton" ) )
            sleep , 10
        SetTimer , HB_Button_Hover , On
        MouseGetPos,,,, ctrl , 2
        if( This.Hwnd != ctrl ){
            This.Draw_Default()
            return False
        }else   {
            This.Draw_Hover()
            return true
        }
    }
}
SetTimer, HB_Button_Hover, 50
;-----------------------------------------------------------------