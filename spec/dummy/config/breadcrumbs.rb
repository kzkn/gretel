crumb :root do
  link "Home", root_path
end

# Demo breadcrumbs
crumb :demo_home do
  link "Demo Home", demo_index_path
  parent :root
end

crumb :default_style do
  link "Default Style", demo_default_style_path
  parent :demo_home
end

crumb :arrow_separator do
  link "Arrow Separator", demo_arrow_separator_path
  parent :demo_home
end

crumb :bullet_separator do
  link "Bullet Separator", demo_bullet_separator_path
  parent :demo_home
end

crumb :dot_separator do
  link "Dot Separator", demo_dot_separator_path
  parent :demo_home
end

crumb :succeeds_separator do
  link "Succeeds Separator", demo_succeeds_separator_path
  parent :demo_home
end

crumb :small_size do
  link "Small Size", demo_small_size_path
  parent :demo_home
end

crumb :medium_size do
  link "Medium Size", demo_medium_size_path
  parent :demo_home
end

crumb :large_size do
  link "Large Size", demo_large_size_path
  parent :demo_home
end

crumb :combined do
  link "Combined Style", demo_combined_path
  parent :demo_home
end

crumb :with_parent do
  link "With Parent", demo_with_parent_path
  parent :default_style
end

# Original test breadcrumbs
if crumb_defined?(:root)
  crumb :home1 do
    link "Home1", root_path
  end
else
  raise 'Unexpected'
end
