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
		"imgui_demo.cpp",
	}

	libdirs
    {   
    }

	includedirs
    {
        "../imgui",
        "../imgui/examples",
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
		buildoptions "/MDd"
		runtime "Debug"
		symbols "on"

		links
		{
			"opengl32.lib",
		}

	filter "configurations:Release"
		buildoptions "/MD"
		runtime "Release"
		optimize "on"

		links
		{
			"opengl32.lib",
		}

	filter "configurations:Ship"
		buildoptions "/MD"
		runtime "Release"
		optimize "On"

        links
        {
			"opengl32.lib",
		}
