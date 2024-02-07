# Devote

Static Widget Extension in SwiftUI

## SwiftUI Widget API

Add new target as Widget  Extension
Static widget won't provide user configurable properties, therefore uncheck the include configuration intent checkbox.

# WidgetKit
A widget elevates key content from an app and displays it where people can see it at a glance.

A widget's main purpose is to display a small amount of timely personally relevant information that people can view without opening the app.

With widgets, users get timely information from their favorite apps at a glance.
Also, users can use widgets on home screen to keep some content or helpful information at their fingertips.
Users can use widgets from today view by swiping right from the home screen or lock screen.

## Building blocks
## Family
The template awidget uses: small, medium or large.
Widget can support one or more sizes, giving users the flexibility to configure their widgets however they like.

## Timeline
An object that specifies a date for WidgetKit to update a widget's view. 

The way widgets provide information is through something called a timeline object to tell WidgetKit when to update a widgets view.
A timeline provider generates a timeline.
A timeline contains an array of timeline entry objects and a refresh policy.
With this, each timeline can manage how to update a particular widget, which is the actual data coming from the main application that the widget can use.

## Entry
An entry creates a timeline for when we want widgetkit to update a widgets view.
To create timeline entries, we need to declare a custom type that conforms to timeline entry.
Each entry specifies the date we would like WidgetKit to update the widget's view and any additional information that our widget needs to render the view.

## Reload Policy

![Reload Policy](https://github.com/ToheedKhan/SwiftUIApps/assets/4839453/b031e346-b155-4d7f-ac72-37f949803ab5)


The timelines Refresh policy specifies the earliest date for Widgetkit to request a new timeline from the provider.
.atEnd - Default
Tells Widgetkit to request a new timeline after the last date in the
array of timeline entries we provide.
This means when the end of the timeline is reached, then the widget will start over with a new series of entries. It will keep updating the widget for undefined times.

.afterDate

We should use this policy to indicate a different date either earlier or later than the default date. Specify an earlier date.
If you know there's a point in time before the end of your timeline entries that may alter the timeline.
Conversely, specify a later date, If you know that after the last date, your timeline won't change for a while.

.never
We can use this policy to tell Widgetkit not to request a new timeline at all.
In that case, our app has to use Widget center to prompt Widgetkit to request a new timeline.
When we decide to use this policy, our responsibility is to determine when updates will be executed.

## Limitations

Just keep in mind that widgets are not mini apps and they have limited capabilities and this is designed on purpose.
So widgets couldn't overuse or abuse the device's energy memory and other crucial resources.
Also note that the widgets view might not be updated precisely at a timeline entry's data and time.


# Shared Asset
We can add dedicated assets for a widget.
However, there is another way to do it by sharing an existing asset of the main iOS application.
To make it happen, we need to select asset and check the checkbox option and modify the target settings in inspector pannel.
