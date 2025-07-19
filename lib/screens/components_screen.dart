import 'package:base_flutter/base.dart';
import 'package:base_flutter/widgets/empty_widget.dart';
import 'package:base_flutter/widgets/loading.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const BaseAppBar(
        title: "Base Components",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons
            _buildSection(context, "Buttons", [
              BasePrimaryButton(text: "Primary Button", onPressed: () {}),
              BasePrimaryButton(
                text: "Disabled Button",
                onPressed: () {},
                isEnable: false,
              ),
              BasePrimaryButton.rounded(
                  text: "Rounded Primary Button", onPressed: () {}),
              BaseSecondaryButton(text: "Secondary Button", onPressed: () {}),
              BaseOutlinedButton(text: "Outlined Button", onPressed: () {}),
              BaseTextButton(text: "Text button", onPressed: () {}),
            ]),
            // TextFields
            _buildSection(context, "TextFields", [
              const BaseTextField(
                markRequired: true,
                label: "This is label",
                hint: "TextField with label",
              ),
              const BaseTextField(
                hint: "TextField without label",
              ),
              const BaseDateField(
                hint: "TextField without label",
              ),
              BaseDropdownField(
                markRequired: true,
                label: "Dropdown Field",
                hint: "Select an option",
              )
            ]),

            //loading
            IndicatorLoading(),

            //Radio
            BaseRadio<MainTab>(
              title: "Option 1",
              value: MainTab.order,
              groupValue: MainTab.order,
            ),
            // Texts
            _buildSection(context, "Common texts", [
              Text(
                "Text E900 - base regular",
                // style: theme.textThemeE900.base,
              ),
              Text(
                "Text E600 - lg medium",
                // style: theme.textThemeE600.lg.medium,
              ),
            ]),
            // Texts
            _buildSection(context, "Custom texts", [
              Text(
                "Text Blue 600 - base regular",
                // style: theme.textThemePrimary.base
                //     .copyWith(color: theme.colorScheme.blue.shade600),
              ),
              Text(
                "Text Red - lg medium",
                // style: theme.textThemePrimary.lg.medium
                //     .copyWith(color: theme.colorScheme.red),
              ),
            ]),
            _buildSection(
              context,
              "SVG",
              [
                SvgPicture.asset(AppIcons.back),
                SvgPicture.asset(AppImages.onboarding1),
              ],
            ),

            EmptyWidget(
              icon: AppIcons.empty,
              message: "Chưa có sản phẩm nào",
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: AppTextStyle.t14w400(AppColors.dodgerBlue),
        ),
        const SizedBox(height: 16),
        for (var child in children) ...[
          child,
          const SizedBox(height: 8),
        ]
      ],
    );
  }
}
