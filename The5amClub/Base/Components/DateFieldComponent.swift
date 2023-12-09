//
//  DateFieldComponent.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI
import UIKit
import Foundation

// MARK: - Date Field Component

struct DateFieldComponent: View {
    // data binding
    @Binding var date: String

    // data passing
    let placeHolder: String

    // state property
    @State private var isFocused = false

    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Text(placeHolder)
                    .font(.custom(StaticFont.bold, size: 15))
                    .foregroundColor(.accentColor)
                    .offset(y: isFocused || !date.isEmpty ? -25 : 0)
                    .scaleEffect(isFocused || !date.isEmpty ? 0.9 : 1, anchor: .leading)

                DatePickerTextField(date: $date, isEditing: $isFocused)
            }
            .padding(.horizontal, 6)

            if isFocused {
                Color.accentColor.frame(height: 2)
            } else {
                Color.gray.frame(height: 1)
            }
        }
        .animation(.easeOut(duration: 0.2), value: isFocused)
    }
}

// MARK: - Date Picker TextField

struct DatePickerTextField: UIViewRepresentable {
    // private constants
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    // data binding
    @Binding var date: String
    @Binding var isEditing: Bool

    func makeUIView(context: Context) -> UITextField {
        // setup datepicker
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self.helper, action: #selector(self.helper.dateValueChanged), for: .valueChanged)

        // setup toolbar for textfield
        let toolbar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: StaticText.done, style: .plain, target: helper, action: #selector(helper.doneButtonTapped))

        toolbar.sizeToFit()
        toolbar.setItems([flexibleSpace, doneButton], animated: true)

        // setup textfield
        textField.inputView = datePicker
        textField.delegate = context.coordinator
        textField.inputAccessoryView = toolbar
        textField.font = UIFont(name: StaticFont.bold, size: 15)
        textField.textColor = UIColor(named: StaticColor.greyText)

        // set date
        helper.onDateValueChanged = {
            date = dateFormatter.string(from: datePicker.date)
        }

        // set date & close date picker
        helper.onDoneButtonTapped = {
            date = dateFormatter.string(from: datePicker.date)

            textField.resignFirstResponder()
        }

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        // update date
        uiView.text = date
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(isEditing: $isEditing)
    }

    class Helper {
        public var onDateValueChanged: (() -> Void)?
        public var onDoneButtonTapped: (() -> Void)?

        @objc func dateValueChanged() {
            onDateValueChanged?()
        }

        @objc func doneButtonTapped() {
            onDoneButtonTapped?()
        }
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var isEditing: Bool

        init(isEditing: Binding<Bool>) {
            self._isEditing = isEditing
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            if !isEditing {
                self.isEditing = true
            }
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            if isEditing {
                self.isEditing = false
            }
        }
    }
}
