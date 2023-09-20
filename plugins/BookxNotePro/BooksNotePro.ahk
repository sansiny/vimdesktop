; 因为BookxNotePro对快捷键支持很不友好，此插件功能不全而且部分功能有问题。
; 仅用于必须临时使用BookxNotePro的场景。

BookxNotePro:
    ; 定义注释
    /* vim.comment("BookxNotePro_NormalMode>", "进入normal模式") */
    /* vim.comment("BookxNotePro_InsertMode>", "进入insert模式") */
	/*
    vim.comment("BookxNotePro_GotoParent>", "进入上一层目录")
    vim.comment("BookxNotePro_Enter>", "进入目录")
    vim.comment("BookxNotePro_IconViewX>", "图标视图 超大")
    vim.comment("BookxNotePro_IconViewR>", "图标视图 大")
    vim.comment("BookxNotePro_IconViewM>", "图标视图 中等")
    vim.comment("BookxNotePro_IconViewN>", "图标视图 小")
    vim.comment("BookxNotePro_IconViewS>", "图标视图 平铺")
    vim.comment("BookxNotePro_ListViewL>", "列表视图 列表")
    vim.comment("BookxNotePro_ListViewD>", "列表视图 详情")
    vim.comment("BookxNotePro_ListViewT>", "列表视图 内容")
    vim.comment("BookxNotePro_Tree>", "定位到左侧目录栏")
    vim.comment("BookxNotePro_Main>", "定位到右侧文件栏")
    vim.comment("BookxNotePro_Rename>", "重命名")
    vim.comment("BookxNotePro_GotoTC>", "使用TC打开当前目录")
    vim.comment("BookxNotePro_GotoTCX>", "使用TC打开当前目录，并关闭BookxNotePro")
    vim.comment("BookxNotePro_GotoTCInNewTab>", "使用TC在新标签页打开当前目录")
    vim.comment("BookxNotePro_GotoTCInNewTabX>", "使用TC在新标签页打开当前目录，并关闭BookxNotePro")
    vim.SetWin("BookxNotePro", "Qt5150QWindowIcon")
	*/
    vim.SetMode("normal", "BookxNotePro")
	vim.SetAction("<pgdn>", "向下")
	vim.SetAction("<pgup>", "向上")

    ; insert模式
    /* vim.mode("insert", "BookxNotePro") */

    /* vim.map("<esc>", "<BookxNotePro_NormalMode>", "BookxNotePro") */

    ; normal模式
    vim.mode("normal", "BookxNotePro")

    vim.map("i", "<BookxNotePro_InsertMode>", "BookxNotePro")
    
    vim.map("j", "<down>", "BookxNotePro")
    vim.map("k", "<up>", "BookxNotePro")

    /* vim.map("h", "<BookxNotePro_GotoParent>", "BookxNotePro") */
    /* vim.map("l", "<BookxNotePro_Enter>", "BookxNotePro") */

    vim.map("t", "<BookxNotePro_Tree>", "BookxNotePro")
    vim.map("m", "<BookxNotePro_Main>", "BookxNote")
    vim.map("n", "<BookxNotePro_IconViewR>", "BookxNotePro")
    vim.map("N", "<BookxNotePro_ListViewD>", "BookxNotePro")
    vim.map("r", "<BookxNotePro_Rename>", "BookxNotePro")

    vim.map("H", "<backspace>", "BookxNotePro")
    vim.map("<c-h>", "<left>", "BookxNotePro")
    vim.map("<c-l>", "<right>", "BookxNotePro")
    vim.map("<c-j>", "<down>", "BookxNotePro")
    vim.map("<c-k>", "<up>", "BookxNotePro")
    vim.map("gg", "<home>", "BookxNotePro")
    vim.map("G", "<end>", "BookxNotePro")
    vim.map("f", "<BookxNotePro_GotoTCInNewTab>", "BookxNotePro")
    vim.map("F", "<BookxNotePro_GotoTC>", "BookxNotePro")

    vim.BeforeActionDo("BookxNotePro_ForceInsertMode", "BookxNotePro")
	*/

return
<pgdn>:
	send,{PgDn}
return
<pgup>:
	send,{PgUp}

/* ; 对指定控件使用insert模式 */
/* BookxNotePro_ForceInsertMode() */
/* { */
/*     ControlGetFocus, ctrl, AHK_CLASS CabinetWClass */
/*     ;MsgBox ctrl */
/*     if (RegExMatch(ctrl, "Edit|DirectUIHWND1") or WinExist("ahk_class #32768")) */
/*         return true */
/*     return false */
/* } */

<BookxNotePro_NormalMode>:
    vim.mode("normal", "BookxNotePro")
return

<BookxNotePro_InsertMode>:
    vim.mode("insert", "BookxNotePro")
return

<BookxNotePro_GotoParent>:
    Send, !{up}
return

<BookxNotePro_IconViewX>:
    ; 这系列命令必须保证鼠标不在焦点文件上才有效
    Send, {Click, right}vx
return

<BookxNotePro_IconViewR>:
    Send, {Click, right}vr
return

<BookxNotePro_IconViewM>:
    Send, {Click, right}vm
return

<BookxNotePro_IconViewN>:
    Send, {Click, right}vn
return

<BookxNotePro_IconViewS>:
    Send, {Click, right}vs
return

<BookxNotePro_ListViewL>:
    Send, {Click, right}vl
return

<BookxNotePro_ListViewD>:
    Send, {Click, right}vd
return

<BookxNotePro_ListViewS>:
    Send, {Click, right}vs
return

<BookxNotePro_ListViewT>:
    Send, {Click, right}vt
return

<BookxNotePro_Enter>:
    Send, {enter}
    sleep, 100
    ; 如果载入目录时间过长，不会自动定位到第一个文件
    Send, {down}{up}{right}{left}
return

<BookxNotePro_Tree>:
    ControlFocus, SysTreeView321
return

<BookxNotePro_Main>:
    ControlFocus, DirectUIHWND3
return

<BookxNotePro_Rename>:
    Send, {f2}
return

<BookxNotePro_GotoTC>:
    BookxNotePro_GotoTC(false)
return

<BookxNotePro_GotoTCX>:
    BookxNotePro_GotoTC(false, true)
return

/* <BookxNotePro_GotoTCInNewTab>: */
/*     BookxNotePro_GotoTC(true) */
/* return */

/* <BookxNotePro_GotoTCInNewTabX>: */
/*     BookxNotePro_GotoTC(true, true) */
/* return */

BookxNotePro_GotoTC(newTab, closeBookxNotePro = false)
{
    OldClipboard := ClipboardAll
    Clipboard =

    Send, ^c
    ClipWait, 0.3

    if (!ErrorLevel)
    {
        FileToOpen := Clipboard
        if (closeBookxNotePro)
        {
            WinClose, A
        }
        TC_OpenPath(FileToOpen, newTab, "/L")
        Clipboard := OldClipboard
        OldClipboard =
    }
    else
    {
        FileToOpen := BookxNotePro_GetPath()
        if (closeBookxNotePro)
        {
            WinClose, A
        }
        TC_OpenPath(FileToOpen, newTab, "/L")
    }

    Clipboard := OldClipboard
    OldClipboard =
}

/* BookxNotePro_GetPath(hwnd = "") */
/* { */
/*     if !(window := BookxNotePro_GetWindow(hwnd)) */
/*         return ErrorLevel := "Error" */
/*     if (window = "desktop") */
/*         return A_Desktop */
/*     path := window.LocationURL */
/*     path := RegExReplace(path, "ftp://.*@", "ftp://") */
/*     StringReplace, path, path, file:/// */
/*     StringReplace, path, path, /, \, All */

    ; thanks to polyethene
    Loop
        if RegExMatch(path, "i)(?<=%)[\da-f]{1,2}", hex)
            StringReplace, path, path, `%%hex%, % Chr("0x" . hex), All
        else Break
    return path
}

/* BookxNotePro_GetAll(hwnd = "") */
/* { */
/*     return BookxNotePro_Get(hwnd) */
/* } */

/* BookxNotePro_GetSelected(hwnd = "") */
/* { */
/*     return BookxNotePro_Get(hwnd, true) */
/* } */

BookxNotePro_GetWindow(hwnd = "")
{
    ; thanks to jethrow for some pointers here
    WinGet, Process, ProcessName, % "ahk_id" hwnd := hwnd ? hwnd:WinExist("A")
    WinGetClass class, ahk_id %hwnd%

    if (Process!="explorer.exe")
        return

    if (class ~= "(Cabinet|Explore)WClass")
    {
        for window in ComObjCreate("Shell.Application").Windows
        if (window.hwnd == hwnd)
            return window
    }
    else if (class ~= "Progman|WorkerW")
        return "desktop" ; desktop found
}

BookxNotePro_Get(hwnd = "", selection = false)
{
    if !(window := BookxNotePro_GetWindow(hwnd))
        return ErrorLevel := "Error"
    if (window="desktop")
    {
        ControlGet, hwWindow, HWND,, SysListView321, ahk_class Progman
        if !hwWindow ; #D mode
            ControlGet, hwWindow, HWND,, SysListView321, A
        ControlGet, files, List, % ( selection ? "Selected":"") "Col1",,ahk_id %hwWindow%
        base := SubStr(A_Desktop,0,1)=="\" ? SubStr(A_Desktop,1,-1) : A_Desktop
        Loop, Parse, files, `n, `r
        {
            path := base "\" A_LoopField
            IfExist %path% ; Ignore special icons like Computer (at least for now)
                ret .= path "`n"
        }
    }
    else
    {
        if selection
            collection := window.document.SelectedItems
        else
            collection := window.document.Folder.Items
        for item in collection
        ret .= item.path "`n"
    }
    return Trim(ret,"`n")
}
return
*/
