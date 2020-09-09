
solution "cmft"
	configurations { "Debug", "Profile", "Release" }
	platforms { "x64" }
	
	--
	-- Debug/Release Configurations
	--
	configuration "Debug"
		defines
		{
			"_DEBUG"
		}
		symbols "On"
		vectorextensions "SSE"
		warnings "Extra"
		
	configuration "Profile"
		defines
		{
			"NDEBUG",
		}
		symbols "On"
		vectorextensions "SSE"
		optimize "Speed"
		warnings "Extra"

	configuration "Release"
		defines
		{
			"NDEBUG"
		}
		symbols "Off"
		vectorextensions "SSE"
		optimize "Speed"
		warnings "Extra"
	
	configuration { "vs*" }
		targetdir ".."
		flags
		{
			"NoManifest",
			"NoMinimalRebuild",
			"No64BitChecks",
		}
		defines
		{
			"_CRT_SECURE_NO_WARNINGS",
		}
		systemversion "latest"
		exceptionhandling "Off"
		editandcontinue "Off"
		buildoptions
		{
			-- multi processor support
			"/MP",
			
			-- warnings to ignore:
			-- "/wd4711", -- smells like old people
			
			-- warnings to force
			
			-- An accessor overrides, with or without the virtual keyword, a base class accessor function,
			-- but the override or new specifier was not part of the overriding function signature.
			"/we4485",
		}
		
	
	configuration { "vs*", "Debug" }
		buildoptions
		{
			-- turn off Smaller Type Check
			--"/RTC-",
		
			-- turn off Basic Runtime Checks
			--"/RTC1-",
		}
			
	configuration { "vs*", "Profile" }
		buildoptions
		{
			-- Produces a program database (PDB) that contains type information and symbolic debugging information for use with the debugger
			-- /Zi does imply /debug
			"/Zi",
			
			-- turn off Whole Program Optimization
			--"/GL-",
			
			-- Inline Function Expansion: Any Suitable (/Ob2)
			--"/Ob2",
			
			-- enable Intrinsic Functions
			"/Oi",
			
			-- Favor fast code
			"/Ot",
			
			-- Omit Frame Pointers - FIXME: maybe not for profile builds?
			"/Oy",
		}
		linkoptions
		{
			-- turn off Whole Program Optimization
			-- "/LTCG-",
			
			-- create .pdb file
			"/DEBUG",
		}
		
	configuration { "vs*", "Release" }
		buildoptions
		{
			-- turn off Whole Program Optimization
			--"/GL-",
			
			-- Inline Function Expansion: Any Suitable (/Ob2)
			"/Ob2",
			
			-- Favor fast code
			"/Ot",
			
			-- enable Intrinsic Functions
			"/Oi",
			
			-- Omit Frame Pointers
			"/Oy",
		}

project "cmft"
	targetname "cmft"
	language "C++"
	kind "ConsoleApp"
	files
	{
		"../src/**.h", "../src/**.cpp",
	}
	includedirs
	{
		"../src/cmft",
		"../include",
		"../dependency",
	}
	defines
	{
		--"IMGUI_IMPL_OPENGL_LOADER_GLAD",
	}
	excludes
	{
		"../src/cmft/clcontext.cpp",
	}
	
	configuration { "vs*", "x32" }
		defines
		{
			"_WIN32",
		}
		
	configuration { "vs*", "x64" }
		libdirs
		{
			--"../externals/SDL2/lib/win64",
		}
		links
		{
			--"SDL2",
			"advapi32",
			"gdi32",
			"kernel32",
			"ole32",
			--"opengl32",
			"user32",
			"ws2_32",
			"winmm",
			--"dinput8",
			--"dsound",
			--"dxguid",
			--"Xinput9_1_0"
		}
			
	

	

