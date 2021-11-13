#!/usr/bin/env ruby
#
# Requirements:
#
# gem install reverse_markdown byebug
#
require "reverse_markdown"
require "byebug"
$vars = {
  "site.baseurl" => "https://theforeman.org"
}
$ids = {
  "4.3SmartProxies" => "_4_3_smart_proxies",
  "3.1SystemRequirements" => "_3_1_system_requirements",
  "3.5.4PuppetReports" => "_3_5_4_puppet_reports",
  "3.2ForemanInstaller" => "_3_2_foreman_installer",
  "3.6Upgrade" => "_3_6_upgrade_to_3_1",
  "3.5.2ConfigurationOptions" => "_3_5_2_configuration_options",
  "3.5.3DatabaseSetup" => "_3_5_3_database_setup",
  "5.4.1SecuringPuppetMasterRequests" => "_5_4_1_securing_puppet_server_requests",
  "3.1.1SupportedPlatforms" => "_3_1_1_supported_platforms",
  "5.5.1Backup" => "_5_5_1_backup",
  "4.2.2Classes)" => "_4_2_2_classes)",
  "4.2.6SmartMatchers" => "_4_2_5_smart_matchers",
  "4.3.4DHCP" => "_4_3_4_dhcp",
  "4.3.5DNS" => "_4_3_5_dns",
  "4.3.6Puppet" => "_4_3_6_puppet",
  "4.3.7PuppetCA" => "_4_3_7_puppet_ca",
  "4.3.8Realm" => "_4_3_8_realm",
  "4.3.12Templates" => "_4_3_12_templates",
  "4.3.9TFTP" => "_4_3_9_tftp",
  "4.3.2SmartProxySettings" => "_4_3_2_smart_proxy_settings",
  "ForemanArchitecture" => "_foreman_architecture",
  "3.3InstallFromPackages" => "_3_3_install_from_packages",
  "4.3.10SSL" => "_4_3_10_ssl",
  "ssl-cipher-suites" => "_ssl_cipher_suites",
  "4.3.1SmartProxyInstallation" => "_4_3_1_smart_proxy_installation",
  "4.1.4Auditing" => "_4_1_4_auditing",
  "5.1.6APIVersioning" => "_5_1_6_api_versioning",
  "5.1.2JSONResponseFormatforCollections" => "_5_1_2_json_response_format_for_collections",
  "5.1.3JSONResponseFormatforSingleObjects" => "_5_1_3_json_response_format_for_single_objects",
  "5.1.4CustomizeJSONResponses" => "_5_1_4_customize_json_responses",
  "5.4SecuringCommunicationswithSSL" => "_5_4_securing_communications_with_ssl",
  "3.2.2InstallerOptions" => "_3_2_2_installer_options",
  "4.2.5ParameterizedClasses" => "_4_2_4_parameterized_classes",
  "2.1Installation" => "_2_1_installation",
  "5.2ComputeResources" => "_5_2_compute_resources",
  "6.Plugins" => "_6_plugins",
  "4.1.2RolesandPermissions" => "_4_1_2_roles_and_permissions",
  "4.3.7Puppet" => "_4_3_7_puppet_ca",
  "4.2.4SmartVariables" => "_4_2_4_parameterized_classes",
  "4.3.13Logs" => "_4_3_13_logs",
  "4.1.5Searching" => "_4_1_5_searching",
  "7.1NoVNC" => "_7_1_novnc",
  "5.2.10PasswordEncryption" => "_5_2_9_password_encryption",
}

def state!(state)
  #puts "*** #{state} ***"
  $state = state
end

def state?(state)
  $state == state
end

def v(name)
  $vars[name] || raise("Variable #{name} not found")
end

R_ATTR=/{{ ?([a-zA-Z0-9\.-]+) ?}}/
R_INCL=/{% ?include ([a-zA-Z0-9_\/\.-]+) ?%}/
R_HIGL=/{% ?highlight ([a-zA-Z0-9_\/\.-]+) ?%}/
R_HIGE=/{% ?endhighlight ?%}/
R_DEEP=/^######+\s*(.*)\s*$/
R_PREL=/^\s*<\/?pre>\s*$/
R_PREI=/<\/?pre>/
R_HITK=/^\s*```([^ ]*)$/
R_IMGE=/\(\/(static\/[^ )]+\.(png|jpg|jpeg|gif))/
R_LINK=/\(\/?manuals\/[^\/]+\/index\.html#([^ )]+)\)/
R_TABS=/<table/
R_TABE=/<\/table>/
state!(:start)

def process(file)
  lineno=0
  puts "\n"
  File.readlines(file).each do |line|
    lineno += 1
    if line == "---\n" and state?(:start)
      state!(:header)
      line = ''
    elsif line == "---\n" and state?(:header)
      state!(:body)
      line = ''
    elsif state?(:header)
      name, value = line.split(/: ?/)
      $vars["page.#{name}"] = value.strip.delete('"')
      line = ''
    elsif state?(:body) || state?(:block) || state?(:table)
      while m = R_ATTR.match(line)
        line.sub!(R_ATTR, v(m[1]))
      end
      while m = R_INCL.match(line)
        filename = "_includes/#{m[1]}"
        if File.exists?(filename)
          process(filename)
          line.sub!(R_INCL, "\n")
        else
          line.sub!(R_INCL, "Missing content. Consider contributing, you kind soul!")
        end
      end
      if (state?(:body) || state?(:block)) && m = R_HITK.match(line)
        if state?(:body)
          if m[1]
            line = "\n~~~ #{m[1]}"
          else
            line = "\n~~~"
          end
          state!(:block)
        else
          line = "~~~"
          state!(:body)
        end
      end
      while m = R_HIGL.match(line)
        raise("Unclosed block at #{file} line #{lineno}") if state?(:block)
        if m[1]
          line = "\n~~~ #{m[1]}"
        else
          line = "\n~~~"
        end
        state!(:block)
      end
      while m = R_HIGE.match(line)
        line = "~~~"
        state!(:body)
      end
      while m = R_IMGE.match(line)
        line.sub!(R_IMGE, '(' + m[1])
      end
      while m = R_LINK.match(line)
        newl = "(\##{$ids[m[1]]})"
        raise("ID #{m[1]} not found") unless newl
        line.sub!(R_LINK, newl)
      end
      while state?(:body) && m = R_DEEP.match(line)
        line.sub!(R_DEEP, "**\\1**\n\n")
      end
      while state?(:body) && m = R_PREL.match(line)
        line.sub!(R_PREL, "\n~~~")
      end
      while state?(:body) && m = R_PREI.match(line)
        line.sub!(R_PREI, '`')
      end
      if R_TABS.match(line) && state?(:body)
        state!(:table)
        $table = ''
      end
      if R_TABE.match(line) && state?(:table)
        $table += line
        line = "~~~\n#{$table}\n~~~"
        line = ReverseMarkdown.convert $table
        state!(:body)
      end
      if state?(:table)
        $table += line
        line = ''
      end
    end
    puts(line) unless line == ''
  end
  puts "\n"
end
process("manuals/#{ARGV[0]}/index.md")

