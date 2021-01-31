project "ImGui"
	kind "StaticLib"
	language "C++"
	toolset ("v142")

	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
	objdir ("bin-temp/" .. outputDir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp"
	}

	libdirs
    {        
        "..//SFML-2.0/lib",
    }


	includedirs
    {
        "../SFML-2.0/include",
        "../imgui",
        "../imgui-sfml",
    }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

		links
		{
			"sfml-graphics-s-d.lib",
			"sfml-window-s-d.lib",
			"sfml-system-s-d.lib"
		}

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

		links
		{
			"sfml-graphics-s.lib",
            "sfml-window-s.lib",
            "sfml-system-s.lib",
		}

	filter "configurations:Ship"
		runtime "Release"
		optimize "On"

        links
        {
            "sfml-graphics-s.lib",
            "sfml-window-s.lib",
            "sfml-system-s.lib"
		}
