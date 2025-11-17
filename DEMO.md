# Gretel Bulma Breadcrumbs Demo

This demo showcases the Bulma breadcrumb style implementation in Gretel.

## Running the Demo

1. **Navigate to the dummy app directory:**
   ```bash
   cd spec/dummy
   ```

2. **Install dependencies (if not already done):**
   ```bash
   bundle install
   ```

3. **Set up the database:**
   ```bash
   rails db:migrate
   ```

4. **Start the Rails server:**
   ```bash
   rails server
   ```

5. **Open your browser and visit:**
   ```
   http://localhost:3000
   ```

## What You'll See

The demo includes interactive examples of all Bulma breadcrumb variations:

### Separator Styles
- **Default** - Standard Bulma breadcrumb with forward slash separator (/)
- **Arrow** - Arrow separator (→) using `has-arrow-separator`
- **Bullet** - Bullet separator (•) using `has-bullet-separator`
- **Dot** - Dot separator (·) using `has-dot-separator`
- **Succeeds** - Succeeds separator (≻) using `has-succeeds-separator`

### Size Variations
- **Small** - Compact breadcrumbs using `is-small`
- **Medium** - Medium-sized breadcrumbs using `is-medium`
- **Large** - Large breadcrumbs using `is-large`

### Combined Styles
- **Combined** - Demonstrates combining separator and size (e.g., arrow + large)

### Parent Hierarchy
- **With Parent** - Shows multi-level breadcrumb trail with parent hierarchy

## Features Demonstrated

Each demo page shows:
1. The ERB code used to generate the breadcrumb
2. The rendered breadcrumb with Bulma 1.0.4 styling
3. A description of the style
4. The raw HTML output

## Technologies Used

- **Rails** - The dummy app framework
- **Gretel** - Breadcrumb management
- **Bulma 1.0.4** - CSS framework loaded via CDN
- **Bulma Breadcrumb Component** - Provides separator and size styling

## Files Created

```
spec/dummy/
├── app/
│   ├── controllers/
│   │   └── demo_controller.rb
│   └── views/
│       ├── layouts/
│       │   └── application.html.erb
│       └── demo/
│           ├── index.html.erb
│           ├── default_style.html.erb
│           ├── arrow_separator.html.erb
│           ├── bullet_separator.html.erb
│           ├── dot_separator.html.erb
│           ├── succeeds_separator.html.erb
│           ├── small_size.html.erb
│           ├── medium_size.html.erb
│           ├── large_size.html.erb
│           ├── combined.html.erb
│           └── with_parent.html.erb
└── config/
    ├── routes.rb (updated)
    └── breadcrumbs.rb (updated)
```

## Testing with Tailwind CSS

While this demo uses Bulma CSS, the same breadcrumb structure works with Tailwind CSS
when you apply Bulma-compatible classes. You can:

1. Replace the Bulma CDN link with your Tailwind CSS setup
2. Add custom Tailwind classes that replicate Bulma's breadcrumb styling
3. Use the same Gretel configuration with `style: :bulma`

## Notes

- The breadcrumbs automatically include `aria-label="breadcrumbs"` on the `<nav>` tag
- The current/active item has `aria-current="page"` for accessibility
- All breadcrumbs use semantic HTML: `<nav>` → `<ul>` → `<li>`
- The structure follows Bulma's breadcrumb component specification

## Troubleshooting

If you encounter any issues:

1. Make sure you're in the `spec/dummy` directory
2. Run `bundle install` to ensure all dependencies are installed
3. Run `rails db:migrate` to set up the database
4. Check that port 3000 is available
5. Try `rails server -p 3001` if port 3000 is in use

## Learn More

- [Gretel Documentation](https://github.com/kzkn/gretel)
- [Bulma Breadcrumb Documentation](https://bulma.io/documentation/components/breadcrumb/)
- [Tailwind CSS](https://tailwindcss.com/)
