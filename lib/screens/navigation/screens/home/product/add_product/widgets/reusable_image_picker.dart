import 'dart:io';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReusableImagePicker extends StatefulWidget {
  final Function(File?) onImageSelected; // Callback to return selected image file

  const ReusableImagePicker({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  _ReusableImagePickerState createState() => _ReusableImagePickerState();
}

class _ReusableImagePickerState extends State<ReusableImagePicker> {
  File? _selectedImage;
  String? _imageName;

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _imageName = pickedFile.name;
      });

      widget.onImageSelected(_selectedImage); // Send image back
    }
  }

  // Function to remove the selected image
  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _imageName = null;
    });

    widget.onImageSelected(null);
  }

  // Function to show bottom sheet for choosing gallery or camera
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Picture'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        // // Upload Button
        // ElevatedButton.icon(
        //   onPressed: _showImageSourceDialog,
        //   icon: Icon(Icons.upload),
        //   label: Text("Select Image"),
        // ),

        // SizedBox(height: AppSizes.paddingSmallValue),

        
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMediumValue),
            child: Container(
              color: AppColors.containerBackground(context),
              
              child: _selectedImage != null ?
               Padding(
                 padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingSmallValue,
                vertical: AppSizes.paddingXSmallValue,
              ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _imageName ?? "No file selected",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body(context),
                      ),
                    ),
                    IconButton(
                      onPressed: _removeImage,
                      icon: Icon(Icons.close, 
                      color: AppColors.redAccent(context),
                      size: AppSizes.iconSizeSmallValue,
                      ),
                    ),
                  ],
                               ),
               ) :
              GestureDetector(
                onTap: _showImageSourceDialog,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMediumValue,
                vertical: AppSizes.paddingSmallValue,
              ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Select Image", style: AppTextStyles.body(context),)
                    ],
                  ),
                ),
              ),
              
            ),
          ),
          // Show Selected Image Preview
        if (_selectedImage != null) ...[
          SizedBox(height: AppSizes.paddingSmallValue),
          SizedBox(
            height: 250,
            child: AspectRatio(
              aspectRatio: 16/9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMediumValue),
                child: Image.file(
                  _selectedImage!,
                  width: double.infinity,
                  
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
